import 'package:fitness_app/data/models/recipe_model.dart';
import 'package:fitness_app/data/web_services/recipes_web_service.dart';

class RecipesRepository {
  final RecipesWebService recipesWebService;

  RecipesRepository(this.recipesWebService);

  Future<List<Recipe>> getRecipes(String diet) async {
    final recipes = await recipesWebService.getRecipes(diet);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  Future<List<Recipe>> getHighProteinRecipes(String diet) async {
    final recipes = await recipesWebService.getRecipes(diet);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }
}
