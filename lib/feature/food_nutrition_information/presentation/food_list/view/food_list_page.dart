import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/repositories/food_repository_impl.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_list/food_list_cubit.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_list/food_list_state.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_list/widgets/food_list_empty.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_list/widgets/food_list_error.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_list/widgets/food_list_loading.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_list/widgets/food_list_populated.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_list/widgets/food_search_bar.dart';
import 'package:nutrifacts/feature/food_nutrition_information/presentation/food_list/widgets/theme_picker.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodListCubit(FoodRepositoryImpl()),
      child: const FoodView(),
    );
  }
}

class FoodView extends StatefulWidget {
  const FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const FoodSearchBar(),
            BlocBuilder<FoodListCubit, FoodListState>(
              builder: (context, state) {
                return switch (state.status) {
                  FoodListStatus.initial => const ThemePicker(),
                  FoodListStatus.loading => const FoodListLoading(),
                  FoodListStatus.success => state.foods.isEmpty
                      ? const FoodListEmpty()
                      : FoodListPopulated(state.foods),
                  FoodListStatus.failure => const FoodListError()
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
