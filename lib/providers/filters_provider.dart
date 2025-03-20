import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter{
  lactoseFree,
  glutenFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter,bool>> {
  FilterNotifier() : super({
    Filter.lactoseFree:false,
    Filter.glutenFree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,
  });

  void setFilters(Map<Filter,bool> chosenFilters){
    state=chosenFilters;
  }

  void setFilter(Filter filter,bool isActive){
    state={
      ...state,
      filter:isActive,
    };
  }
}

final filtersProvider= StateNotifierProvider<FilterNotifier, Map<Filter,bool>>((ref)=>FilterNotifier());


final filteredMealsProvider = Provider((ref){

    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
});