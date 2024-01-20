// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodDto _$FoodDtoFromJson(Map<String, dynamic> json) => FoodDto(
      FoodInfoDto.fromJson(json['food'] as Map<String, dynamic>),
      (json['measures'] as List<dynamic>)
          .map((e) => MeasureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodDtoToJson(FoodDto instance) => <String, dynamic>{
      'food': instance.foodInfoDto,
      'measures': instance.measuresDto,
    };

FoodInfoDto _$FoodInfoDtoFromJson(Map<String, dynamic> json) => FoodInfoDto(
      id: json['foodId'] as String,
      name: json['label'] as String,
      nutrientsPer100gDto: NutrientsPer100gDto.fromJson(
          json['nutrients'] as Map<String, dynamic>),
      imageUrl: json['image'] as String?,
    );

Map<String, dynamic> _$FoodInfoDtoToJson(FoodInfoDto instance) =>
    <String, dynamic>{
      'foodId': instance.id,
      'label': instance.name,
      'image': instance.imageUrl,
      'nutrients': instance.nutrientsPer100gDto,
    };

NutrientsPer100gDto _$NutrientsPer100gDtoFromJson(Map<String, dynamic> json) =>
    NutrientsPer100gDto(
      energy: json['ENERC_KCAL'] as num,
      protein: json['PROCNT'] as num,
      fat: json['FAT'] as num,
      carbohydrate: json['CHOCDF'] as num,
    );

Map<String, dynamic> _$NutrientsPer100gDtoToJson(
        NutrientsPer100gDto instance) =>
    <String, dynamic>{
      'ENERC_KCAL': instance.energy,
      'PROCNT': instance.protein,
      'FAT': instance.fat,
      'CHOCDF': instance.carbohydrate,
    };

MeasureDto _$MeasureDtoFromJson(Map<String, dynamic> json) => MeasureDto(
      name: json['label'] as String,
      grams: json['weight'] as num,
    );

Map<String, dynamic> _$MeasureDtoToJson(MeasureDto instance) =>
    <String, dynamic>{
      'label': instance.name,
      'weight': instance.grams,
    };
