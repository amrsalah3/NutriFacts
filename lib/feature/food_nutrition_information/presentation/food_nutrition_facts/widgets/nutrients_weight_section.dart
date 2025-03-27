import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/core/common/utils/extensions.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_nutrition_facts/food_nutrition_facts_cubit.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';

class NutrientsWeightSection extends StatelessWidget {
  const NutrientsWeightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodNutritionFactsCubit, Food>(
      builder: (context, food) => Column(
        children: [
          NutrientWeightRow(
            name: NutrientType.Protein.name,
            grams: food.nutrients[NutrientType.Protein]!.grams,
          ),
          NutrientWeightRow(
            name: NutrientType.Carbohydrate.name,
            grams: food.nutrients[NutrientType.Carbohydrate]!.grams,
          ),
          NutrientWeightRow(
            name: NutrientType.Fat.name,
            grams: food.nutrients[NutrientType.Fat]!.grams,
          ),
        ],
      ),
    );
  }
}

/// Displays a row containing the [name] of a nutrient (e.g. Protein)
/// of a food quantity, and the corresponding weight of the nutrient in [grams].
class NutrientWeightRow extends StatelessWidget {
  const NutrientWeightRow({
    super.key,
    required this.name,
    required this.grams,
  });

  final String name;
  final double grams;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          "${grams.withTwoFractionDigits} g",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
