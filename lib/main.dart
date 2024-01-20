import 'package:flutter/material.dart';

import 'feature/food_nutrition_information/presentation/food_list/view/food_list_page.dart';

void main() => runApp(const NutriFactsApp());

class NutriFactsApp extends StatelessWidget {
  const NutriFactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriFacts',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const FoodListPage(),
    );
  }
}
