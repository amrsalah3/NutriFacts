import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FoodListLoading extends StatelessWidget {
  const FoodListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballPulse,
              colors: [Theme.of(context).colorScheme.primary],
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "Fetching list of foods",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
