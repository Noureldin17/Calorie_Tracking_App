import 'package:flutter/material.dart';

List<String> classes = [
  "Bread",
  "Pancake",
  "Waffle",
  "Bagel",
  "Muffin",
  "Doughnut",
  "Hamburger",
  "Pizza",
  "Sandwich",
  "Hot dog",
  "French fries",
  "Apple",
  "Orange",
  "Banana",
  "Grape"
];

List<Map> MacrosPerServing = [
  {
    "calories": 265,
    "Fats": 3.2,
    "Carbs": 49.0,
    "Protein": 9.0,
    "Density": 0.25,
    "Class": "Flat"
  },
  {
    "calories": 227,
    "Fats": 10.0,
    "Carbs": 28.0,
    "Protein": 6.0,
    "Density": 0.66,
    "Class": "Flat"
  },
  {
    "calories": 291,
    "Fats": 14.0,
    "Carbs": 33.0,
    "Protein": 8.0,
    "Density": 0.66,
    "Class": "Flat"
  },
  {
    "calories": 250,
    "Fats": 1.5,
    "Carbs": 49.0,
    "Protein": 10.0,
    "Density": 0.35,
    "Class": "Flat"
  },
  {
    "calories": 377,
    "Fats": 16.0,
    "Carbs": 54.0,
    "Protein": 4.5,
    "Density": 0.45,
    "Class": "Sphere"
  },
  {
    "calories": 412,
    "Fats": 22.8,
    "Carbs": 47.0,
    "Protein": 5.7,
    "Density": 0.64,
    "Class": "Sphere"
  },
  {
    "calories": 295,
    "Fats": 20.0,
    "Carbs": 10.0,
    "Protein": 17.0,
    "Density": 1.0,
    "Class": "Sphere"
  },
  {
    "calories": 266,
    "Fats": 10.0,
    "Carbs": 33.0,
    "Protein": 11.0,
    "Density": 0.8,
    "Class": "Flat"
  },
  {
    "calories": 304,
    "Fats": 14.5,
    "Carbs": 33.0,
    "Protein": 10.0,
    "Density": 0.55,
    "Class": "Flat"
  },
  {
    "calories": 290,
    "Fats": 26.0,
    "Carbs": 4.2,
    "Protein": 10.0,
    "Density": 0.95,
    "Class": "Flat"
  },
  {
    "calories": 312,
    "Fats": 15.0,
    "Carbs": 41.0,
    "Protein": 3.5,
    "Density": 0.25,
    "Class": "Flat"
  },
  {
    "calories": 52,
    "Fats": 0.2,
    "Carbs": 12.0,
    "Protein": 0.3,
    "Density": 0.71,
    "Class": "Sphere"
  },
  {
    "calories": 49,
    "Fats": 0.1,
    "Carbs": 12.0,
    "Protein": 0.9,
    "Density": 0.9,
    "Class": "Sphere"
  },
  {
    "calories": 89,
    "Fats": 0.3,
    "Carbs": 22.8,
    "Protein": 1.0,
    "Density": 0.95,
    "Class": "Cylinder"
  },
  {
    "calories": 67,
    "Fats": 0.4,
    "Carbs": 17.0,
    "Protein": 0.6,
    "Density": 1.0,
    "Class": "Flat"
  },
];

List<Image> Food_Icons = [
  Image.asset("assets/foodicons/bread.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/pancakes.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/waffle.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/bagel.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/muffin.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/donut.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/hamburger.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/pizza.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/sandwich.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/hot-dog.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/french-fries.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/apple.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/orange.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/banana.png", fit: BoxFit.contain),
  Image.asset("assets/foodicons/grape.png", fit: BoxFit.contain),
];
