import 'package:fitness_app/data/models/recipe_model.dart';
import 'package:fitness_app/data/web_services/recipes_web_service.dart';

class RecipesRepository {
  final RecipesWebService recipesWebService;

  RecipesRepository(this.recipesWebService);

  Future<List<Recipe>> getRecipes(
      List<String> diet, List<String> health) async {
    final recipes = await recipesWebService.getRecipes(diet, health);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  Future<List<Recipe>> getHighProteinRecipes(
      List<String> diet, List<String> health) async {
    final recipes = await recipesWebService.getRecipes(diet, health);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  Future<List<Recipe>> getLowCarbRecipes(
      List<String> diet, List<String> health) async {
    final recipes = await recipesWebService.getRecipes(diet, health);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  Future<List<Recipe>> getLowFatRecipes(
      List<String> diet, List<String> health) async {
    final recipes = await recipesWebService.getRecipes(diet, health);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  Future<List<Recipe>> getGlutenFreeRecipes(
      List<String> diet, List<String> health) async {
    final recipes = await recipesWebService.getRecipes(diet, health);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  Future<List<Recipe>> getKetoRecipes(
      List<String> diet, List<String> health) async {
    final recipes = await recipesWebService.getRecipes(diet, health);
    return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
  }
}
