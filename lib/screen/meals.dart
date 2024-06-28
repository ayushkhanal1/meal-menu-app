import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/mealdetailscreen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;
  void selectmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetail(meal: meal),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onselectmeal: (meal) {
                selectmeal(context, meal);
              },
            ));
    if (meals.isEmpty) {
      content = const Center(
        child: Text('nothing here.try selecting other category',style: TextStyle(color: Colors.white),),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
