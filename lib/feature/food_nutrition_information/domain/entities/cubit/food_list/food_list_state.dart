import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';

enum FoodListStatus { initial, loading, success, failure }

extension FoodListStatusChecks on FoodListStatus {
  bool get isInitial => this == FoodListStatus.initial;

  bool get isLoading => this == FoodListStatus.loading;

  bool get isSuccess => this == FoodListStatus.success;

  bool get isFailure => this == FoodListStatus.failure;
}

class FoodListState {
  FoodListState({
    this.status = FoodListStatus.initial,
    List<Food>? foods,
  }) : foods = foods ?? List.empty();

  final FoodListStatus status;
  final List<Food> foods;

  FoodListState copyWith({
    FoodListStatus? status,
    List<Food>? foods,
    Food? selectedFood,
  }) {
    return FoodListState(
      status: status ?? this.status,
      foods: foods ?? this.foods,
    );
  }
}
