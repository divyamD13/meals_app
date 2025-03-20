import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs_screen.dart';
// import 'package:meals_app/widget/main_drawer.dart';

enum Filter{
  lactoseFree,
  glutenFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter,bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSetState = false;
  var _lactoseFreeSetState = false;
  var _vegetarianSetState = false;
  var _veganSetState = false;

    @override
  void initState() {
    super.initState();
    _glutenFreeSetState = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeSetState = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianSetState = widget.currentFilters[Filter.vegetarian]!;
    _veganSetState = widget.currentFilters[Filter.vegan]!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //         (MaterialPageRoute(builder: (ctx) => TabsScreen())));
      //   }
      // }),
  //     PopScope(
  // canPop: false,
  // onPopInvokedWithResult: (bool didPop, dynamic result) {
  //   if(didPop) return;
  //     Navigator.of(context).pop({
  //       Filter.glutenFree: _glutenFreeFilterSet,
  //       Filter.lactoseFree: _lactoseFreeFilterSet,
  //       Filter.vegetarian: _vegetarianFilterSet,
  //       Filter.vegan: _veganFilterSet,
  //     });
  //   },
   
      body:PopScope(
        canPop: false,
  onPopInvokedWithResult: (bool didPop, dynamic result) {
    if(didPop) return;
      Navigator.of(context).pop({
        Filter.glutenFree: _glutenFreeSetState,
        Filter.lactoseFree: _lactoseFreeSetState,
        Filter.vegetarian: _vegetarianSetState,
        Filter.vegan: _veganSetState,
      });
    },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeSetState,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeSetState = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeSetState,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeSetState = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianSetState,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianSetState = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
            ),
            SwitchListTile(
              value: _veganSetState,
              onChanged: (isChecked) {
                setState(() {
                  _veganSetState = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
