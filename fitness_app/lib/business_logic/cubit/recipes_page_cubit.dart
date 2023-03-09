import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/recipe_model.dart';
import '../../data/repository/recipes_repository.dart';

part 'recipes_page_state.dart';

class RecipesPageCubit extends Cubit<RecipesPageState> {
  RecipesPageCubit(this.recipesRepository) : super(RecipesPageInitial());

  static RecipesPageCubit get(context) =>
      BlocProvider.of<RecipesPageCubit>(context);

  final RecipesRepository recipesRepository;

  List<Recipe> KetoRecipes = [];
  List<Recipe> GlutenFreeRecipes = [];
  List<Recipe> LowFatRecipes = [];
  List<Recipe> LowCarbRecipes = [];

  List<Recipe> getKetoRecipes() {
    emit(KetoRecipesLoading());
    try {
      recipesRepository.getKetoRecipes(
          ['balanced'], ['keto-friendly', 'alcohol-free']).then((recipes) {
        this.KetoRecipes = recipes;
        emit(KetoRecipesLoaded());
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.KetoRecipes;
  }

  List<Recipe> getGlutenFreeRecipes() {
    emit(GlutenRecipesLoading());
    try {
      recipesRepository.getGlutenFreeRecipes(
          ['balanced'], ['gluten-free', 'alcohol-free']).then((recipes) {
        this.GlutenFreeRecipes = recipes;
        emit(GlutenRecipesLoaded());
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.GlutenFreeRecipes;
  }

  List<Recipe> getLowCarbRecipes() {
    emit(LowCarbRecipesLoading());
    try {
      recipesRepository
          .getLowCarbRecipes(['low-carb'], ['alcohol-free']).then((recipes) {
        this.LowCarbRecipes = recipes;
        emit(LowCarbRecipesLoaded());
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.LowCarbRecipes;
  }

  List<Recipe> getLowFatRecipes() {
    emit(LowFatRecipesLoading());
    try {
      recipesRepository
          .getLowFatRecipes(['low-fat'], ['alcohol-free']).then((recipes) {
        this.LowFatRecipes = recipes;
        emit(LowFatRecipesLoaded());
      });
    } catch (_) {
      emit(RecipesLoadError());
    }
    return this.LowFatRecipes;
  }
}
