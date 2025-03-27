import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/core/common/utils/extensions.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_nutrition_facts/food_nutrition_facts_cubit.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_nutrition_facts/widgets/food_quantity_section.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_nutrition_facts/widgets/nutrients_weight_section.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_nutrition_facts/widgets/percentages_section.dart';

class FoodNutritionFacts extends StatelessWidget {
  const FoodNutritionFacts({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodNutritionFactsCubit(food),
      child: const FoodNutritionFactsView(),
    );
  }
}

class FoodNutritionFactsView extends StatelessWidget {
  const FoodNutritionFactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodNutritionFactsCubit, Food>(builder: (context, food) {
      return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                food.name,
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            FoodQuantitySection(),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    food.energy.withOneFractionDigit,
                    style: const TextStyle(
                      fontFamily: 'ConcertOne',
                      fontSize: 24,
                    ),
                  ),
                  const Text("calories"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  PercentagesSection(),
                  SizedBox(height: 10),
                  NutrientsWeightSection(),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
