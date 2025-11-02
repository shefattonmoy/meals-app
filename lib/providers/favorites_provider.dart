import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotofier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotofier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotofier, List<Meal>>((ref) {
      return FavoriteMealsNotofier();
    });
