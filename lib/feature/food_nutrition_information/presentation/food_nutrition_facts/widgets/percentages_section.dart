import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/core/common/utils/extensions.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_nutrition_facts/food_nutrition_facts_cubit.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';
import 'package:nutrifacts/feature/food_nutrition_information/utils/extensions.dart';

class PercentagesSection extends StatelessWidget {
  const PercentagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final food = context.read<FoodNutritionFactsCubit>().state;
    final protein = food.percentProtein;
    final carbohydrate = food.percentCarbohydrate;
    final fat = food.percentFat;

    return Column(
      children: [
        PercentagesBar(protein: protein, carbohydrate: carbohydrate, fat: fat),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LegendWidget(
              name: "${protein.withOneFractionDigit}% Protein",
              color: NutrientColor.protein,
            ),
            LegendWidget(
              name: "${carbohydrate.withOneFractionDigit}% Carbohydrates",
              color: NutrientColor.carbohydrate,
            ),
            LegendWidget(
              name: "${fat.withOneFractionDigit}% Fat",
              color: NutrientColor.fat,
            ),
          ],
        ),
      ],
    );
  }
}

class PercentagesBar extends StatelessWidget {
  PercentagesBar(
      {super.key,
      required this.fat,
      required this.carbohydrate,
      required this.protein});

  // Percentages
  final double fat;
  final double carbohydrate;
  final double protein;

  // Bar properties
  final betweenSpace = 0.5;
  final barThickness = 5.0;
  final double proteinStartY = 0.0;
  late final double proteinEndY = fat;
  late final double carbStartY = proteinEndY + betweenSpace;
  late final double carbEndY = carbStartY + carbohydrate;
  late final double fatStartY = carbEndY + betweenSpace;
  late final double fatEndY = fatStartY + fat;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: SizedBox(
        width: 10,
        child: BarChart(
          BarChartData(
            titlesData: const FlTitlesData(
              leftTitles: AxisTitles(),
              rightTitles: AxisTitles(),
              topTitles: AxisTitles(),
              bottomTitles: AxisTitles(),
            ),
            barTouchData: BarTouchData(enabled: false),
            borderData: FlBorderData(show: false),
            gridData: const FlGridData(show: false),
            barGroups: [
              BarChartGroupData(
                x: 0,
                groupVertically: true,
                barRods: [
                  BarChartRodData(
                    fromY: proteinStartY,
                    toY: proteinEndY,
                    color: NutrientColor.protein,
                    width: barThickness,
                  ),
                  BarChartRodData(
                    fromY: carbStartY,
                    toY: carbEndY,
                    color: NutrientColor.carbohydrate,
                    width: barThickness,
                  ),
                  BarChartRodData(
                    fromY: fatStartY,
                    toY: fatEndY,
                    color: NutrientColor.fat,
                    width: barThickness,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.name,
    required this.color,
    this.fontSize = 10,
  });

  final String name;
  final Color color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          name,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
