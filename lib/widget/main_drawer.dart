import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 48, color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(width: 18),
                Text(
                  'Cooking up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                )
              ],
            )),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 28,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 28,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          onTap: (){},
        )
      ],
    ));
  }
}
