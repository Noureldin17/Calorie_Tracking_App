import 'dart:math';
import 'package:fitness_app/data/models/detection_results_model.dart';
import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/DetectionInfoView.dart';
import 'package:fitness_app/presentation/widgets/PrimaryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants/detection_constants.dart' as constants;
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/CalorieMetricsCard.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/MealCard.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/SaveFoodModalSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  static const platform = const MethodChannel("food.detection/java");
  num calories_consumed = 0;
  num carbs_consumed = 0;
  num protein_consumed = 0;
  num fats_consumed = 0;

  List<Map> BreakFast = [];
  List<Map> Lunch = [];
  List<Map> Dinner = [];

  List<Map> New_Detections = [];
  List<double> Food_Volumes = [];

  List<Map> FoodInfo = constants.MacrosPerServing;
  List<String> FoodClasses = constants.classes;

  PageController pageController = new PageController();

  bool LastPage = false;
  String ButtonText = "Next";
  bool saved = false;

  void OnAddFood(int meal) {
    StartDetection(meal);
  }

  void OnChangedWeight(num weight, num calories, int index) {
    setState(() {
      New_Detections[index]["Weight"] = weight.round();
      New_Detections[index]["Calories"] = calories.round();
    });
  }

  void AddItemToMeal(List<Map> Items, int Meal) {
    switch (Meal) {
      case 1:
        setState(() {
          Items.forEach((element) {
            BreakFast.add(element);
            calories_consumed += element["Calories"];
            carbs_consumed += element["Carbs"];
            protein_consumed += element["Protein"];
            fats_consumed += element["Fats"];
          });
        });
        break;
      case 2:
        setState(() {
          Items.forEach((element) {
            Lunch.add(element);
            calories_consumed += element["Calories"];
            carbs_consumed += element["Carbs"];
            protein_consumed += element["Protein"];
            fats_consumed += element["Fats"];
          });
        });
        break;
      case 3:
        setState(() {
          Items.forEach((element) {
            Dinner.add(element);
            calories_consumed += element["Calories"];
            carbs_consumed += element["Carbs"];
            protein_consumed += element["Protein"];
            fats_consumed += element["Fats"];
          });
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 60.sp, right: 10.sp),
            child: FloatingActionButton(
              child: SvgPicture.asset(
                'assets/icons/camera.svg',
                color: Colors.white,
              ),
              backgroundColor: colors.PrimaryColor,
              onPressed: () {
                StartDetection(0);
              },
            ),
          ),
          backgroundColor: colors.BackgroundColor,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 205.sp,
                          ),
                          MealCard(
                            ImageAsset: 'assets/egg.png',
                            MealTitle: 'Breakfast',
                            MealItems: BreakFast,
                            OnAddFood: OnAddFood,
                          ),
                          MealCard(
                            ImageAsset: 'assets/Beef.png',
                            MealTitle: 'Lunch',
                            MealItems: Lunch,
                            OnAddFood: OnAddFood,
                          ),
                          MealCard(
                            ImageAsset: 'assets/salad.png',
                            MealTitle: 'Dinner',
                            MealItems: Dinner,
                            OnAddFood: OnAddFood,
                          ),
                          SizedBox(
                            height: 70.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CalorieMetricsCard(
                  calories_consumed: calories_consumed,
                  carbs_consumed: carbs_consumed,
                  fats_consumed: fats_consumed,
                  protein_consumed: protein_consumed),
            ],
          )),
    );
  }

  void StartDetection(int Flag) {
    runJava().then((value) {
      setState(() {
        Food_Volumes =
            CalculateVolumes(value.Food_Names!, value.Box_Len!, value.Box_Wid!);
        for (int i = 0; i < Food_Volumes.length; i++) {
          num ItemCalories =
              FoodInfo[FoodClasses.indexOf(value.Food_Names![i])]["calories"];
          num ItemCarbs =
              FoodInfo[FoodClasses.indexOf(value.Food_Names![i])]["Carbs"];
          num ItemProtein =
              FoodInfo[FoodClasses.indexOf(value.Food_Names![i])]["Protein"];
          num ItemFats =
              FoodInfo[FoodClasses.indexOf(value.Food_Names![i])]["Fats"];
          num ItemWeight = Food_Volumes[i] *
              FoodInfo[FoodClasses.indexOf(value.Food_Names![i])]["Density"];

          New_Detections.add({
            "Item_Name": value.Food_Names![i],
            "Calories": (ItemCalories * ItemWeight) / 100,
            "Weight": ItemWeight,
            "Carbs": (ItemCarbs * ItemWeight) / 100,
            "Protein": (ItemProtein * ItemWeight) / 100,
            "Fats": (ItemFats * ItemWeight) / 100
          });
        }
      });

      if (New_Detections.isNotEmpty) {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Material(
                color: Color.fromARGB(144, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0),
                              borderRadius: BorderRadius.circular(12)),
                          height: 280.sp,
                          width: 265.sp,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: DefaultText.Bold(
                                    text:
                                        "Detected Items (${New_Detections.length})",
                                    textcolor: colors.PrimaryTextColor,
                                    size: 16.sp),
                              ),
                              // Padding(padding: EdgeInsets.all(4.sp)),
                              Divider(
                                height: 3,
                                thickness: 1,
                              ),

                              Expanded(
                                child: PageView.builder(
                                  itemBuilder: (context, index) =>
                                      DetectionInfoView(
                                    ItemIndex: index,
                                    OnChangeWeight: OnChangedWeight,
                                    Estimated_Calories: New_Detections[index]
                                        ["Calories"],
                                    Estimated_Weight: New_Detections[index]
                                        ["Weight"],
                                    Detection_Name: New_Detections[index]
                                        ["Item_Name"],
                                    Icon_Image: constants.Food_Icons[constants
                                        .classes
                                        .indexOf(New_Detections[index]
                                            ["Item_Name"])],
                                  ),
                                  itemCount: New_Detections.length,
                                  physics: BouncingScrollPhysics(),
                                  controller: pageController,
                                  onPageChanged: (value) {
                                    print(New_Detections.length);
                                    if (value == New_Detections.length - 1) {
                                      setState(() {
                                        LastPage = true;
                                      });
                                    } else {
                                      setState(() {
                                        LastPage = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 6.sp, 0, 6.sp),
                                child: SmoothPageIndicator(
                                  controller: pageController,
                                  count: New_Detections.length,
                                  effect: ExpandingDotsEffect(
                                      dotHeight: 4,
                                      dotWidth: 4,
                                      expansionFactor: 2,
                                      activeDotColor:
                                          Color.fromARGB(255, 51, 102, 255),
                                      dotColor:
                                          Color.fromARGB(255, 173, 200, 255)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(4.sp)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(14.sp, 0, 14.sp, 0),
                        child: PrimaryButton(
                            buttonText: "Next",
                            OnPressed: () {
                              print(New_Detections.length);
                              if (LastPage == true ||
                                  New_Detections.length == 1) {
                                Navigator.pop(context);
                                setState(() {
                                  LastPage = false;
                                  saved = true;
                                });
                                RunModalSheet(Flag);
                              } else {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeInOut);
                              }
                            }),
                      )
                    ],
                  ),
                ));
          },
        );
      }
      // RunModalSheet(Flag);
    });
  }

  void RunModalSheet(int Flag) {
    if (!New_Detections.isEmpty && Flag == 0 && saved) {
      showModalBottomSheet(
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                topRight: Radius.circular(12.sp))),
        context: context,
        builder: (context) {
          return SaveMealModalSheet(
            OnSavePressed: AddItemToMeal,
            ItemsList: New_Detections,
          );
        },
      );
    } else {
      AddItemToMeal(New_Detections, Flag);
    }
    setState(() {
      saved = false;
    });
  }

  Future<DetectionResult> runJava() async {
    setState(() {
      New_Detections = [];
    });
    List<String> food = [];
    List<int> boxlen = [];
    List<int> boxwid = [];

    List<int>? result = await platform.invokeListMethod("start");
    int index = 1;
    for (int i = 0; i < result![0]; i++) {
      food.add(constants.classes[result[i + 1]]);
      index++;
    }
    for (int i = 0; i < result[0]; i++) {
      boxlen.add(result[index]);
      index++;
    }
    for (int i = 0; i < result[0]; i++) {
      boxwid.add(result[index]);
      index++;
    }
    DetectionResult Det_Res = new DetectionResult(food, boxlen, boxwid);

    return Det_Res;
  }

  double HeightToCM(int height) {
    return height / 1595;
  }

  double WidthToCM(int width) {
    return width / 2255;
  }

  List<double> CalculateVolumes(
      List<String> Food_Names, List<int> Box_Lengths, List<int> Box_Widths) {
    List<double> Length_CM = [];
    List<double> Width_CM = [];
    List<double> Volumes = [];

    Box_Lengths.forEach((element) {
      Length_CM.add(HeightToCM(element));
    });

    Box_Widths.forEach((element) {
      Width_CM.add(WidthToCM(element));
    });

    for (int i = 0; i < Food_Names.length; i++) {
      switch (FoodInfo[FoodClasses.indexOf(Food_Names[i])]["Class"]) {
        case "Cylinder":
          if ((Width_CM[i] / Length_CM[i]) <= 0.7) {
            double vol = Length_CM[i] * pi * 3.8;
            Volumes.add(vol);
          } else {
            double vol = Width_CM[i] * pi * 3.8;
            Volumes.add(vol);
          }
          break;
        case "Sphere":
          double depth = 0;
          if (Width_CM[i] > Length_CM[i]) {
            depth = Length_CM[i];
          } else {
            depth = Width_CM[i];
          }
          double vol = Length_CM[i] * Width_CM[i] * depth * 0.77;
          Volumes.add(vol);
          break;
        case "Flat":
          double vol = Length_CM[i] * Width_CM[i] * 2;
          Volumes.add(vol);
          break;
        default:
          break;
      }
    }

    return Volumes;
  }
}
