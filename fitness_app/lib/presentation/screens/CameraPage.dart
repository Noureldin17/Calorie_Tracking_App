import 'package:camera/camera.dart';
import 'package:fitness_app/presentation/widgets/CameraPageWidgets.dart/CameraLoadingCard.dart';
import 'package:flutter/material.dart';
import '../colors.dart' as colors;
import 'package:sizer/sizer.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  XFile? pictureFile;

  @override
  void initState() {
    print("CAMERA PAGE INIT");
    cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.max);

    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var scale = size.aspectRatio * cameraController.value.aspectRatio;
    // if (scale < 1) scale = 1 / scale;
    return Scaffold(
      backgroundColor: Colors.white,
      body: !cameraController.value.isInitialized
          ? CameraLoadingCard()
          : Container(
              height: 450.sp,
              width: 100.w,
              child: CameraPreview(cameraController),
            ),
    );
  }
}
