import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecipesItem extends StatefulWidget {
  const RecipesItem(
      {super.key, required this.RecipeName, required this.RecipeImage});
  final String RecipeImage;
  final String RecipeName;

  @override
  State<RecipesItem> createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          // Image.network(widget.RecipeImage),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(112, 158, 158, 158),
                borderRadius: BorderRadius.circular(22)),
            child: DefaultText.SemiBold(
                text: widget.RecipeName, textcolor: Colors.white, size: 16),
          )
        ],
      ),
    );
  }
}
