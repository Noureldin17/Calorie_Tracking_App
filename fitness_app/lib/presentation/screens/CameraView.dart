// import 'dart:html';
// import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../tflite/classifier.dart';
import '../../tflite/recognition.dart';
import '../../tflite/stats.dart';
import '../../utils/IsolateUtils.dart';
import 'camera_view_singleton.dart';

class CameraView extends StatefulWidget {
  final Function(List<Recognition> recognitions) resultsCallback;

  final Function(Stats stats) statsCallback;
  const CameraView(this.resultsCallback, this.statsCallback);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late List<CameraDescription> cameras;

  late CameraController cameraController;

  bool predicting = false;

  Classifier classifier = Classifier();

  IsolateUtils isolateUtils = IsolateUtils();
  bool done = false;
  @override
  void initState() {
    initStateAsync();
    super.initState();
  }

  Future<void> initStateAsync() async {
    WidgetsBinding.instance.addObserver(this);

    // Spawn a new isolate
    await isolateUtils.start();

    initializeCamera();
  }

  void initializeCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(cameras[0], ResolutionPreset.medium,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.bgra8888);
    cameraController.initialize().then((value) async {
      if (!mounted) {
        return;
      }
      setState(() {
        done = true;
      });
      // Stream of image passed to [onLatestImageAvailable] callback
      await cameraController.startImageStream(onLatestImageAvailable);
      Image image = Image.asset("assets/orange.jpg");

      /// previewSize is size of each image frame captured by controller
      ///
      /// 352x288 on iOS, 240p (320x240) on Android with ResolutionPreset.low
      Size previewSize = cameraController.value.previewSize!;
      print(previewSize);

      /// previewSize is size of raw input image to the model
      CameraViewSingleton.inputImageSize = previewSize;

      // the display width of image on screen is
      // same as screenWidth while maintaining the aspectRatio
      Size screenSize = MediaQuery.of(context).size;
      CameraViewSingleton.screenSize = screenSize;
      CameraViewSingleton.ratio = screenSize.width / previewSize.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return empty container while the camera is not initialized
    if (!done) {
      return Container();
    } else {
      return Container(
        height: 450.sp,
        width: 100.w,
        child: CameraPreview(cameraController),
      );
    }
  }

  onLatestImageAvailable(CameraImage cameraImage) async {
    if (classifier.interpreter != null && classifier.labels != null) {
      if (predicting) {
        // print("PREDICTING");
        return;
      }
      // print("REACHED");
      setState(() {
        predicting = true;
      });

      var uiThreadTimeStart = DateTime.now().millisecondsSinceEpoch;

      // Data to be passed to inference isolate
      var isolateData = IsolateData(
          cameraImage, classifier.interpreter!.address, classifier.labels!);

      // We could have simply used the compute method as well however
      // it would be as in-efficient as we need to continuously passing data
      // to another isolate.

      /// perform inference in separate isolate
      Map<String, dynamic> inferenceResults = await inference(isolateData);
      print("RESULTS");
      print(inferenceResults);
      var uiThreadInferenceElapsedTime =
          DateTime.now().millisecondsSinceEpoch - uiThreadTimeStart;

      // pass results to HomeView
      widget.resultsCallback(inferenceResults["recognitions"]);

      // pass stats to HomeView
      widget.statsCallback((inferenceResults["stats"] as Stats)
        ..totalElapsedTime = uiThreadInferenceElapsedTime);

      // set predicting to false to allow new frames
      setState(() {
        predicting = false;
      });
    }
  }

  /// Runs inference in another isolate
  Future<Map<String, dynamic>> inference(IsolateData isolateData) async {
    ReceivePort responsePort = ReceivePort();
    print("PORT");
    isolateUtils.sendPort
        .send(isolateData..responsePort = responsePort.sendPort);
    var results = await responsePort.first;
    return results;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        cameraController.stopImageStream();
        break;
      case AppLifecycleState.resumed:
        if (!cameraController.value.isStreamingImages) {
          await cameraController.startImageStream(onLatestImageAvailable);
        }
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController.dispose();
    super.dispose();
  }
}
