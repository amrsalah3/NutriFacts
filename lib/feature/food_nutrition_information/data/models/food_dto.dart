import 'package:json_annotation/json_annotation.dart';

part 'food_dto.g.dart';

@JsonSerializable()
class FoodDto {
  const FoodDto(this.foodInfoDto, this.measuresDto);

  @JsonKey(name: 'food')
  final FoodInfoDto foodInfoDto;

  @JsonKey(name: 'measures')
  final List<MeasureDto> measuresDto;

  factory FoodDto.fromJson(Map<String, dynamic> json) =>
      _$FoodDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FoodDtoToJson(this);
}

@JsonSerializable()
class FoodInfoDto {
  const FoodInfoDto({
    required this.id,
    required this.name,
    required this.nutrientsPer100gDto,
    required this.imageUrl,
  });

  @JsonKey(name: 'foodId')
  final String id;
  @JsonKey(name: 'label')
  final String name;
  @JsonKey(name: 'image', defaultValue: null)
  final String? imageUrl;
  @JsonKey(name: 'nutrients')
  final NutrientsPer100gDto nutrientsPer100gDto;

  factory FoodInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FoodInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FoodInfoDtoToJson(this);

  @override
  String toString() {
    return 'Food{id: $id, name: $name, imageUrl: $imageUrl, nutrients: $nutrientsPer100gDto}';
  }
}

@JsonSerializable()
class NutrientsPer100gDto {
  const NutrientsPer100gDto(
      {required this.energy,
      required this.protein,
      required this.fat,
      required this.carbohydrate});

  @JsonKey(name: 'ENERC_KCAL')
  final num energy;
  @JsonKey(name: 'PROCNT')
  final num protein;
  @JsonKey(name: 'FAT')
  final num fat;
  @JsonKey(name: 'CHOCDF')
  final num carbohydrate;

  factory NutrientsPer100gDto.fromJson(Map<String, dynamic> json) =>
      _$NutrientsPer100gDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientsPer100gDtoToJson(this);

  @override
  String toString() {
    return 'NutrientsPer100g{energy: $energy, protein: $protein, fat: $fat, carbohydrate: $carbohydrate}';
  }
}

@JsonSerializable()
class MeasureDto {
  const MeasureDto({required this.name, required this.grams});

  @JsonKey(name: 'label')
  final String name;
  @JsonKey(name: 'weight')
  final num grams;

  factory MeasureDto.fromJson(Map<String, dynamic> json) =>
      _$MeasureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureDtoToJson(this);

  @override
  String toString() {
    return 'Measures{name: $name, grams: $grams}';
  }
}
