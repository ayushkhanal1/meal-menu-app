import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onselectmeal});
  final Meal meal;
  final void Function(Meal meal) onselectmeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          onselectmeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.alarm, label: '${meal.duration} min'),
                        /*const SizedBox(width: 12),
                            MealItemTrait(
                            icon: Icons.work, label: meal.complexity.toString(),),*/
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.money,
                          label: meal.affordability.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
