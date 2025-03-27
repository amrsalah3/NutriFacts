import 'package:nutrifacts/core/common/domain/entities/api_result.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';

abstract class FoodRepository {
  Future<Result<List<Food>>> getFoods(String name);
}
