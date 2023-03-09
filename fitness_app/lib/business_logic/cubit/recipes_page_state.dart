part of 'recipes_page_cubit.dart';

@immutable
abstract class RecipesPageState {}

class RecipesPageInitial extends RecipesPageState {}

class RecipesLoadError extends RecipesPageState {}

class KetoRecipesLoading extends RecipesPageState {}

class GlutenRecipesLoading extends RecipesPageState {}

class LowFatRecipesLoading extends RecipesPageState {}

class LowCarbRecipesLoading extends RecipesPageState {}

class KetoRecipesLoaded extends RecipesPageState {}

class GlutenRecipesLoaded extends RecipesPageState {}

class LowFatRecipesLoaded extends RecipesPageState {}

class LowCarbRecipesLoaded extends RecipesPageState {}
