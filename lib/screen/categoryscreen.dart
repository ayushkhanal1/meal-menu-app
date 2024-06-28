import 'package:flutter/material.dart';
import 'package:meals/dummy_data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/categorygriditem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key,required this.availablemeals});
  final List<Meal> availablemeals;
  void _selectcategory(BuildContext context, Category category) {
    final filteredcategory = availablemeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MealScreen(title: category.title, meals: filteredcategory),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelect: () {
              _selectcategory(context, category);
            },
          )
      ],
    );
  }
}
