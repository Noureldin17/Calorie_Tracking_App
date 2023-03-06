class Recipe {
  String? Label;
  String? ImageUrl;
  List<dynamic>? DietLabels;
  double? Calories;
  double? Weight;
  List<dynamic>? Ingredients;
  double? Carbs;
  double? Fats;
  double? Proteins;

  Recipe.fromJson(Map<String, dynamic> json) {
    Label = json['recipe']['label'];
    ImageUrl = json['recipe']['images']['LARGE'][0];
    DietLabels = json['recipe']['dietLabels'];
    Calories = json['recipe']['calories'];
    Weight = json['recipe']['totalWeight'];
    Ingredients = json['recipe']['ingredientLines'];
    Carbs = json['recipe']['totalNutrients']['CHOCDF']['quantity'];
    Fats = json['recipe']['totalNutrients']['FAT']['quantity'];
    Proteins = json['recipe']['totalNutrients']['PROCNT']['quantity'];
  }
}
