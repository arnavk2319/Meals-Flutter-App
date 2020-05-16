import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("You have no favorites yet - Start addding some!"),
      );
    }
    else
      {
        return ListView.builder(itemBuilder: (ctx,index) {
          return MealItem(
            id : favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            removeItem: null,);
        },
        itemCount: favoriteMeals.length,);
      }

  }
}
