import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters={
  Filter.lactoseFree:false,
  Filter.glutenFree:false,
  Filter.vegetarian:false,
  Filter.vegan:false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favouriteMeals = [];
  // Map<Filter,bool> _selectedFilters=kInitialFilters;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  // void _toggleMealFavouriteStatus(Meal meal) {
  //   final isExisting = _favouriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Removed from favourites');
  //   } else {
  //     setState(() {
  //       _favouriteMeals.add(meal);
  //     });
  //     _showInfoMessage('Marked as favourites');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context)
          .push<Map<Filter,bool>>
          (MaterialPageRoute(builder: (ctx) => FiltersScreen()));

    //       setState(() {
    //         _selectedFilters=result??kInitialFilters;
    //       });

    // print(result);
  }
  }


  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);


    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favouriteMeals=ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
        
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Favourites'),
          ]),
    );
  }
}
