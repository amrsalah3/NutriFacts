import 'package:flutter/material.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_nutrition_facts/view/food_nutrition_facts_dialog.dart';

class FoodListPopulated extends StatelessWidget {
  const FoodListPopulated(this.foods, {super.key});

  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 225,
          childAspectRatio: 1.7,
        ),
        itemCount: foods.length,
        padding: const EdgeInsets.all(4),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: FoodCard(food: foods[index]),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.inversePrimary,
        highlightColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: () => _showFoodNutritionFactsDialog(context, food),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              alignment: Alignment.topLeft,
              child: Text(
                food.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${food.energy.round()} cal",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Expand",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFoodNutritionFactsDialog(BuildContext context, Food food) {
    showDialog(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.8),
      builder: (BuildContext context) {
        return Center(
          child: SizedBox(
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: FoodNutritionFacts(food: food),
              ),
            ),
          ),
        );
      },
    );
  }
}
