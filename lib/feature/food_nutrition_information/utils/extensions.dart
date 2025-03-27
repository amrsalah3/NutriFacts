import 'package:flutter/material.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';

extension NutrientColor on Food {
  static get protein => Colors.green;

  static get carbohydrate => Colors.blue;

  static get fat => Colors.red;
}
