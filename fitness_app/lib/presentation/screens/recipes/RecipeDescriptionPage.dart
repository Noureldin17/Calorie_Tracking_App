import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;

import '../../../data/models/recipe_model.dart';

class RecipeDescriptionPage extends StatefulWidget {
  const RecipeDescriptionPage({super.key, required this.recipe});
  final Recipe recipe;
  @override
  State<RecipeDescriptionPage> createState() => _RecipeDescriptionPageState();
}

class _RecipeDescriptionPageState extends State<RecipeDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.network(
                    widget.recipe.ImageUrl!,
                    width: 100.w,
                    height: 230.sp,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 130.sp,
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.sp, 34.sp, 10.sp, 10.sp),
                      height: 100.sp,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color.fromARGB(244, 0, 0, 0)
                              ])),
                      child: DefaultText.Overflow(
                          text: widget.recipe.Label!,
                          textcolor: Colors.white,
                          size: 18.sp),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
