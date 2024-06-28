import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourite_provider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
             final wasadded= ref
                  .read(favouritemealprovider.notifier)
                  .togglefavouritemeals(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasadded?'Meal added as a favourite':'meal removed from your favourite'),
                ),
              );
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'INGREDIENTS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 249, 12, 12)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(color: Colors.white),
              ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'STEPS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 249, 12, 12)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            for (final step in meal.steps)
              Text(
                step,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
