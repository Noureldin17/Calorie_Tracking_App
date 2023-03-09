import 'package:fitness_app/data/models/recipe_model.dart';
import 'package:fitness_app/data/repository/recipes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit(this.recipesRepository) : super(RecipesInitial());

  static RecipesCubit get(context) => BlocProvider.of<RecipesCubit>(context);

  final RecipesRepository recipesRepository;

  List<Recipe> recipes = [];
  List<Recipe> highproteinrecipes = [];

  List<Recipe> getBalancedRecipes() {
    emit(RecipesLoading());
    try {
      recipesRepository
          .getRecipes(['balanced'], ['alcohol-free']).then((recipes) {
        this.recipes = recipes;
        emit(RecipesLoaded());
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.recipes;
  }

  List<Recipe> getHighProteinRecipes() {
    emit(HPRecipesLoading());
    try {
      recipesRepository.getHighProteinRecipes(
          ['high-protein'], ['alcohol-free']).then((HPrecipes) {
        this.highproteinrecipes = HPrecipes;
        emit(HPRecipesLoaded());
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.highproteinrecipes;
  }
}
