import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_cubit.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_state.dart';

import 'core/di/service_locator.dart';
import 'feature/food_nutrition_information/presentation/food_list/view/food_list_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const NutriFactsApp());
}

class NutriFactsApp extends StatelessWidget {
  const NutriFactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<UserPreferencesCubit>()..fetchThemeColor(),
      child: BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
        builder: (context, state) => MaterialApp(
          title: 'NutriFacts',
          theme: ThemeData(
            colorSchemeSeed: state.themeColor,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorSchemeSeed: state.themeColor,
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: const FoodListPage(),
        ),
      ),
    );
  }
}
