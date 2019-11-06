import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: _favoriteMeals[index].id,
          title: _favoriteMeals[index].title,
          imageUrl: _favoriteMeals[index].imageUrl,
          duration: _favoriteMeals[index].duration,
          affordability: _favoriteMeals[index].affordability,
          complexity: _favoriteMeals[index].complexity,
        );
      },
      itemCount: _favoriteMeals.length,
    );
  }
}
