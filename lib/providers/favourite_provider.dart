import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouritesMealNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealNotifier() : super([]);
  bool togglefavouritemeals(Meal meal) {
     final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritemealprovider = StateNotifierProvider<FavouritesMealNotifier,List<Meal>>(
  (ref) {
    return FavouritesMealNotifier();
  },
);
