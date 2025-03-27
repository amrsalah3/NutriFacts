import 'package:flutter/material.dart';

class FoodListError extends StatelessWidget {
  const FoodListError({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "Something went wrong!",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
