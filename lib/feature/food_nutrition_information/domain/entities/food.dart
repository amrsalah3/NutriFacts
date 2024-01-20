class Food {
  const Food({
    required this.id,
    required this.name,
    required this.weight,
    required this.energy,
    this.nutrients = const {},
    this.measurements = const {},
  });

  static const empty = Food(
    id: "-",
    name: "Unknown",
    weight: Measurement.empty,
    energy: 0,
  );

  final String id;
  final String name;
  final Measurement weight;
  final double energy;
  final Map<NutrientType, Nutrient> nutrients;
  final Map<MeasurementType, Measurement> measurements;

  Food copyWith({
    String? id,
    String? name,
    Measurement? weight,
    double? energy,
    Map<NutrientType, Nutrient>? nutrients,
    Map<MeasurementType, Measurement>? measurements,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      energy: energy ?? this.energy,
      nutrients: nutrients ?? this.nutrients,
      measurements: measurements ?? this.measurements,
    );
  }

  @override
  String toString() {
    return 'Food{id: $id, name: $name, weight: $weight, energy: $energy, nutrients: $nutrients, measurements: $measurements}';
  }
}

extension NutrientsRelativePercentage on Food {
  double get proteinCarbFatTotalGrams =>
      nutrients[NutrientType.Protein]!.grams +
      nutrients[NutrientType.Carbohydrate]!.grams +
      nutrients[NutrientType.Fat]!.grams;

  double get percentProtein =>
      100 * nutrients[NutrientType.Protein]!.grams / proteinCarbFatTotalGrams;

  double get percentCarbohydrate =>
      100 *
      nutrients[NutrientType.Carbohydrate]!.grams /
      proteinCarbFatTotalGrams;

  double get percentFat =>
      100 * nutrients[NutrientType.Fat]!.grams / proteinCarbFatTotalGrams;
}

enum NutrientType { Protein, Carbohydrate, Fat, None }

class Nutrient {
  const Nutrient({
    required this.type,
    required this.grams,
  });

  static const empty = Nutrient(type: NutrientType.None, grams: 0);

  final NutrientType type;
  final double grams;

  Nutrient copyWith({NutrientType? type, double? grams}) {
    return Nutrient(
      type: type ?? this.type,
      grams: grams ?? this.grams,
    );
  }

  @override
  String toString() {
    return 'Nutrient{type: $type, grams: $grams}';
  }
}

enum MeasurementType {
  Gram,
  Ounce,
  Pound,
  Kilogram,
  Pinch,
  Liter,
  Gallon,
  Pint,
  Quart,
  Milliliter,
  Drop,
  Cup,
  Tablespoon,
  Teaspoon,
  None,
}

class Measurement {
  const Measurement({
    required this.type,
    required this.quantity,
    required this.gramsPerUnit,
  }) : totalGrams = quantity * gramsPerUnit;

  static const empty = Measurement(
    type: MeasurementType.None,
    quantity: 0,
    gramsPerUnit: 0,
  );

  final MeasurementType type;
  final double quantity;
  final double gramsPerUnit;
  final double totalGrams;

  Measurement copyWith({
    MeasurementType? type,
    double? quantity,
    double? gramsPerUnit,
  }) {
    return Measurement(
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      gramsPerUnit: gramsPerUnit ?? this.gramsPerUnit,
    );
  }
}
