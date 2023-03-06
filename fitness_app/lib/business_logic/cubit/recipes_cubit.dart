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
      recipesRepository.getRecipes('balanced').then((recipes) {
        loads++;
        if (loads == 2) emit(RecipesLoaded(recipes, highproteinrecipes));
        this.recipes = recipes;
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.recipes;
  }

  List<Recipe> getHighProteinRecipes() {
    emit(RecipesLoading());
    try {
      recipesRepository.getRecipes('high-protein').then((recipes) {
        loads++;
        if (loads == 2) emit(RecipesLoaded(recipes, highproteinrecipes));
        this.highproteinrecipes = recipes;
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.highproteinrecipes;
  }
}
