import 'package:flutter/material.dart';

class FoodListEmpty extends StatelessWidget {
  const FoodListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "No data for this type of food",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
