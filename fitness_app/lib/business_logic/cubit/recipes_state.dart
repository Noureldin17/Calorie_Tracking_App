part of 'recipes_cubit.dart';

@immutable
abstract class RecipesState {}

class RecipesInitial extends RecipesState {}

class RecipesLoadError extends RecipesState {}

class RecipesLoading extends RecipesState {}

class HPRecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {}

class HPRecipesLoaded extends RecipesState {}
