import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nutrifacts/core/common/domain/entities/api_result.dart';
import 'package:nutrifacts/core/common/domain/entities/error_info.dart';
import 'package:nutrifacts/core/common/utils/api_constants.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/models/food_dto.dart';

class EdamamApiDataSource {
  EdamamApiDataSource({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = EdamamApiConstants.baseUrl;
  static const _apiAppId = EdamamApiConstants.apiAppId;
  static const _apiAppKey = EdamamApiConstants.apiAppKey;

  final http.Client _httpClient;

  Future<Result<List<FoodDto>>> getFoods(String name) async {
    try {
      final url = Uri.parse(
        "$_baseUrl/parser?app_id=$_apiAppId&app_key=$_apiAppKey&ingr=$name",
      );
      final response = await _httpClient.get(url);

      if (response.statusCode != 200) {
        return Result.failure(
          ErrorInfo(
            statusCode: response.statusCode,
            message: response.reasonPhrase,
          ),
        );
      }

      final jsonFoods = jsonDecode(response.body)['hints'] as List;
      final foodDtos = List<FoodDto>.empty(growable: true);
      for (var jsonFood in jsonFoods) {
        try {
          foodDtos.add(FoodDto.fromJson(jsonFood as Map<String, dynamic>));
        } catch (exception) {
          continue;
        }
      }
      return Result.success(foodDtos);
    } catch (exception) {
      return Result.failure(ErrorInfo(message: exception.toString()));
    }
  }
}
