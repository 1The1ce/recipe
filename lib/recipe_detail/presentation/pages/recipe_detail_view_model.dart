import 'package:flutter/material.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';

import '../../data/models/recipe_model.dart';
import '../../data/repositories/recipe_detail_repository.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required RecipeDetailRepository repo,
    required this.recipeId
  }) : _repo = repo {
    load();
  }
  final RecipeDetailRepository _repo;
  final int recipeId;
  bool loading = true;
  late RecipeModel recipe;

  Future<void> load() async {
    loading = true;
    notifyListeners();
    recipe = await _repo.fetchRecipeById(recipeId);
    loading = false;
    notifyListeners();
  }
}
