import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/core/common/utils/extensions.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_nutrition_facts/food_nutrition_facts_cubit.dart';

class FoodQuantitySection extends StatelessWidget {
  FoodQuantitySection({super.key});

  final TextEditingController _foodQuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final foodCubit = context.read<FoodNutritionFactsCubit>();
    return Column(
      children: [
        FoodQuantityRow(
          label: "Measurement Unit",
          optionsWidget: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: foodCubit.state.weight.type.name,
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.arrow_drop_down_rounded),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(10),
              items: foodCubit.state.measurements.keys.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit.name,
                  child: Text(unit.name),
                );
              }).toList(),
              hint: const Text("Unit"),
              onChanged: foodCubit.toggleFoodWeightUnit,
            ),
          ),
        ),
        FoodQuantityRow(
          label: "Quantity",
          optionsWidget: TextField(
            controller: _foodQuantityController
              ..text = foodCubit.state.weight.quantity.withOneFractionDigit,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              TextInputFormatter.withFunction((oldValue, newValue) =>
                  newValue.text.isEmptyOrValidNumber ? newValue : oldValue)
            ],
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            cursorColor: Colors.blue,
            decoration: const InputDecoration(border: InputBorder.none),
            onSubmitted: foodCubit.toggleFoodQuantity,
          ),
        ),
      ],
    );
  }
}

/// Widget for displaying a row inside the food nutrition facts,
/// a row contains a [label] and a correspondent [optionsWidget]
/// to edit or pick from. Used for quantity measurement.
class FoodQuantityRow extends StatelessWidget {
  const FoodQuantityRow(
      {super.key, required this.label, required this.optionsWidget});

  final String label;
  final Widget optionsWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                label,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: optionsWidget,
            ),
          ),
        ],
      ),
    );
  }
}
