import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_cubit.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_state.dart';

class ThemePicker extends StatelessWidget {
  const ThemePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ColorCircle(Colors.green),
          Gap(8),
          ColorCircle(Colors.blue),
          Gap(8),
          ColorCircle(Colors.purple),
          Gap(8),
          ColorCircle(Colors.red),
        ],
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;

  const ColorCircle(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
      builder: (context, state) => GestureDetector(
        onTap: () => context.read<UserPreferencesCubit>().setThemeColor(color),
        child: CircleAvatar(
          radius: state.themeColor.value == color.value ? 12 : 10,
          backgroundColor: color,
        ),
      ),
    );
  }
}
