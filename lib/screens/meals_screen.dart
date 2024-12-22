import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
  super.key,
  required this.title,
  required this.meals
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content=ListView.builder(itemBuilder: (ctx,index)=>Text(
      meals[index].title
    ),
    itemCount: meals.length,
    );

if(meals.isEmpty){
  content =  Center(child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('No meals available',
       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      color: Theme.of(context).colorScheme.onSurface),
      ),
      const SizedBox(height: 5,),
      Text('Please select a different category',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface),
      ),
    ],
  ));
}

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}