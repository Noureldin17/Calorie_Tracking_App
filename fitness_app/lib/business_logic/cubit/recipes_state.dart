part of 'recipes_cubit.dart';

@immutable
abstract class RecipesState {}

class RecipesInitial extends RecipesState {}

class RecipesLoadError extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<Recipe> recipes;
  final List<Recipe> highproteinrecipes;
  RecipesLoaded(this.recipes, this.highproteinrecipes);
}
