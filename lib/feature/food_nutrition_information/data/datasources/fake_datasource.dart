import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nutrifacts/core/common/domain/entities/api_result.dart';
import 'package:nutrifacts/core/common/domain/entities/error_info.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/models/food_dto.dart';

class FakeDataSource {
  Future<Result<List<FoodDto>>> getFoods(String name) async {
    /// Local JSON sample data just for usage during the development
    try {
      await Future.delayed(Duration(milliseconds: 500));
      final response = await rootBundle.loadString(
        "assets/sample_api_responses/sample_food_list_edamam_response.json",
      );
      final jsonFoods = jsonDecode(response)['hints'] as List;
      final foodDtos = List<FoodDto>.empty(growable: true);
      for (var jsonFood in jsonFoods) {
        try {
          foodDtos.add(FoodDto.fromJson(jsonFood as Map<String, dynamic>));
        } catch (e) {
          continue;
        }
      }
      return Result.success(foodDtos);
    } catch (exception) {
      return Result.failure(ErrorInfo(message: exception.toString()));
    }
  }
}
