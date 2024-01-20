import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_list/food_list_cubit.dart';

/// Animated search bar
/// Its Animation sequence:
/// When applying a search for the first time:
/// 1. Expand the bar horizontally by reducing its horizontal padding.
/// 2. Move the bar up to the top of the screen, and hide its colored enlightening shadow at the same time.
/// 3. Make a space for search results, then do the search.
class FoodSearchBar extends StatefulWidget {
  const FoodSearchBar({super.key});

  @override
  State<FoodSearchBar> createState() => _FoodSearchBarState();
}

class _FoodSearchBarState extends State<FoodSearchBar> {
  bool _firstSearch = true;
  String? _query = "";

  // Initial animated values
  Alignment alignment = Alignment.center;
  double _horizontalPadding = 32;
  int _flex = 1;
  late Color _shadowColor;

  @override
  Widget build(BuildContext context) {
    if (_firstSearch) _shadowColor = Theme.of(context).colorScheme.primary;
    return Expanded(
      flex: _flex,
      child: AnimatedAlign(
        alignment: alignment,
        duration: Durations.medium2,
        curve: Curves.easeOut,
        onEnd: () => setState(() {
          // After moving the bar to the top and hiding its enlightening shadow,
          // collapse the bar's bottom (hidden) expansion so that search result list
          // below it can be shown properly, then do the search.
          _flex = 0;
          context.read<FoodListCubit>().getFoodList(_query!);
        }),
        child: AnimatedPadding(
          padding: EdgeInsets.only(
            left: _horizontalPadding,
            right: _horizontalPadding,
            top: 8,
          ),
          duration: Durations.medium2,
          curve: Curves.easeOut,
          onEnd: () => setState(() {
            // After expanding the bar horizontally, move the bar to
            // the top of the screen and hide its enlightening shadow.
            alignment = Alignment.topCenter;
            _shadowColor = Colors.transparent;
          }),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: _shadowColor,
                  spreadRadius: 2,
                  blurRadius: 10,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            duration: Durations.extralong4,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintText: "Search food for nutrition facts",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                ),
                onSubmitted: (String foodName) async {
                  if (await checkNoInternet()) return;
                  _query = foodName;
                  if (_firstSearch) {
                    _firstSearch = false;
                    // Animate expansion of the search bar to the full width
                    // by reducing the horizontal padding.
                    setState(() => _horizontalPadding = 4);
                  } else {
                    // Do the search directly without any animations.
                    context.read<FoodListCubit>().getFoodList(_query!);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> checkNoInternet() async {
    final isNotConnected =
        (await Connectivity().checkConnectivity()) == ConnectivityResult.none;
    if (isNotConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "No internet connection",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    return isNotConnected;
  }
}
