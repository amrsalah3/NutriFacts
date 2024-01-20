import 'package:nutrifacts/core/common/domain/entities/api_result.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/datasources/edamam_api_datasource.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/models/mapper/food_mappers.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/repositories/food_repository.dart';

class FoodRepositoryImpl extends FoodRepository {
  FoodRepositoryImpl({EdamamApiDataSource? dataSource})
      : _dataSource = dataSource ?? EdamamApiDataSource();

  final EdamamApiDataSource _dataSource;

  @override
  Future<Result<List<Food>>> getFoods(String name) async {
    final result = await _dataSource.getFoods(name);
    return switch (result) {
      Success() => Result.success(result.data.toDomain()),
      Failure() => Result.failure(result.errorInfo)
    };
  }
}
