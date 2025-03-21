import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsFavourite = state.contains(meal);

    if(mealIsFavourite){
      state= state.where((m)=>m.id!=meal.id).toList();
      return false;
    }
    else{
      state=[...state,meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealNotifier,List<Meal>>((ref){
  return FavouriteMealNotifier();
});