import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  void _removeItem(String id) {
    setState(() {
      widget.favouriteMeals.removeWhere((meal) => meal.id == id);
    });
  }


  @override
  Widget build(BuildContext context) {
    if(widget.favouriteMeals.isEmpty){
      return Center(
        child: Text('You have no favorites yet- start adding some!'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            title: widget.favouriteMeals[index].title,
            url: widget.favouriteMeals[index].imageUrl,
            duration: widget.favouriteMeals[index].duration,
            complexity: widget.favouriteMeals[index].complexity,
            affordability: widget.favouriteMeals[index].affordability,
            removeItem: _removeItem,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
