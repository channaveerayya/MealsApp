import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const mealDetailRoute = '/mealDetail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Container(
        child: Text(mealId),
      ),
    );
  }
}
