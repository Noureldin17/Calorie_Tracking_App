import 'package:fitness_app/data/models/recipe_model.dart';
import 'package:fitness_app/data/repository/recipes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit(this.recipesRepository) : super(RecipesInitial());

  static RecipesCubit get(context) => BlocProvider.of<RecipesCubit>(context);

  final RecipesRepository recipesRepository;
  int loads = 0;
  List<Recipe> recipes = [];
  List<Recipe> highproteinrecipes = [];

  List<Recipe> getBalancedRecipes() {
    emit(RecipesLoading());
    try {
      this.recipes = recipes;
      recipesRepository.getRecipes('balanced').then((recipes) {
        loads++;
        if (loads == 2) emit(RecipesLoaded(recipes, this.highproteinrecipes));
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.recipes;
  }

  List<Recipe> getHighProteinRecipes() {
    emit(RecipesLoading());
    try {
      recipesRepository.getHighProteinRecipes('high-protein').then((HPrecipes) {
        this.highproteinrecipes = HPrecipes;
        loads++;
        if (loads == 2) emit(RecipesLoaded(this.recipes, HPrecipes));
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.highproteinrecipes;
  }
}
