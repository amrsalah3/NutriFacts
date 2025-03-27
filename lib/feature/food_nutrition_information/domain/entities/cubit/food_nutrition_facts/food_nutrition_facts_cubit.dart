import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';

class FoodNutritionFactsCubit extends Cubit<Food> {
  FoodNutritionFactsCubit(super.food);

  /// Converts food weight measurement unit to the specified [unit].
  void toggleFoodWeightUnit(String? unit) {
    final type = MeasurementType.values.asNameMap()[unit];
    if (type == null || !state.measurements.containsKey(type)) {
      throw ArgumentError("Invalid measurement unit $unit for this food.");
    }

    final currentQuantity = state.weight.quantity;
    final updatedWeight =
        state.measurements[type]!.copyWith(quantity: currentQuantity);
    _updateNutrientFacts(updatedWeight);
  }

  void toggleFoodQuantity(String? updatedQuantity) {
    updatedQuantity = updatedQuantity ?? "";
    final quantity = double.tryParse(updatedQuantity);
    if (quantity == null || quantity == 0) return;

    final updatedWeight = state.weight.copyWith(quantity: quantity);
    _updateNutrientFacts(updatedWeight);
  }

  void _updateNutrientFacts(Measurement foodWeight) {
    final energy =
        (state.energy / state.weight.totalGrams) * foodWeight.totalGrams;
    final nutrients = state.nutrients.map((key, old) {
      final nutrientGrams =
          (old.grams / state.weight.totalGrams) * foodWeight.totalGrams;
      return MapEntry(key, old.copyWith(grams: nutrientGrams));
    });

    emit(
      state.copyWith(weight: foodWeight, energy: energy, nutrients: nutrients),
    );
  }
}
