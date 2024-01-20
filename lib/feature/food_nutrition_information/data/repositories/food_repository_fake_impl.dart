import 'package:nutrifacts/core/common/domain/entities/api_result.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/datasources/fake_datasource.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/models/mapper/food_mappers.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/repositories/food_repository.dart';

class FoodRepositoryFakeImpl extends FoodRepository {
  FoodRepositoryFakeImpl({FakeDataSource? dataSource})
      : _dataSource = dataSource ?? FakeDataSource();

  final FakeDataSource _dataSource;

  @override
  Future<Result<List<Food>>> getFoods(String name) async {
    final result = await _dataSource.getFoods(name);
    return switch (result) {
      Success() => Result.success(result.data.toDomain()),
      Failure() => Result.failure(result.errorInfo)
    };
  }
}
