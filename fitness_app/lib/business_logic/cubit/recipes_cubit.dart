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

  List<Recipe> getRecipes() {
    recipesRepository.getRecipes().then((recipes) {
      emit(RecipesLoaded(recipes));
      this.recipes = recipes;
    });
    return this.recipes;
  }
}
