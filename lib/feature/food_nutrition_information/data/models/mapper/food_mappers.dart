import 'package:nutrifacts/feature/food_nutrition_information/data/models/food_dto.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/food.dart';

extension FoodMapper on FoodDto {
  Food toDomain() {
    final nutrients = {
      NutrientType.Protein: Nutrient(
        type: NutrientType.Protein,
        grams: foodInfoDto.nutrientsPer100gDto.protein.toDouble(),
      ),
      NutrientType.Carbohydrate: Nutrient(
        type: NutrientType.Carbohydrate,
        grams: foodInfoDto.nutrientsPer100gDto.carbohydrate.toDouble(),
      ),
      NutrientType.Fat: Nutrient(
        type: NutrientType.Fat,
        grams: foodInfoDto.nutrientsPer100gDto.fat.toDouble(),
      ),
    };

    final domainMeasurementTypes = MeasurementType.values.asNameMap();
    final measurements = <MeasurementType, Measurement>{};
    for (var measure in measuresDto) {
      if (!domainMeasurementTypes.containsKey(measure.name)) continue;
      final measurement = Measurement(
        type: domainMeasurementTypes[measure.name]!,
        quantity: 1,
        gramsPerUnit: measure.grams.toDouble(),
      );
      measurements[measurement.type] = measurement;
    }

    if (measurements.isEmpty) {
      measurements[Measurement.empty.type] = Measurement.empty;
    }

    // All data received from Edamam API are per 100 grams of food.
    const apiResponseMeasurement = Measurement(
      type: MeasurementType.Gram,
      quantity: 100,
      gramsPerUnit: 1,
    );

    final food = Food(
      id: foodInfoDto.id,
      name: foodInfoDto.name,
      weight: apiResponseMeasurement,
      energy: foodInfoDto.nutrientsPer100gDto.energy.toDouble(),
      nutrients: nutrients,
      measurements: measurements,
    );

    return food;
  }
}

extension FoodListMapper on List<FoodDto> {
  List<Food> toDomain() => map((foodDto) => foodDto.toDomain()).toList();
}
