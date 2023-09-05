// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:second_application/data/dummyData.dart';
import 'package:second_application/models/category.dart';
import 'package:second_application/models/meal.dart';
import 'package:second_application/screen/meals.dart';
import 'package:second_application/widget/CateGrid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                  title: category.title,
                  meals: filteredMeals,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 30,
          mainAxisExtent: 120),
      children: [
        for (final category in availableCategories)
          CategoryGrid(
            category: category,
            onSelectCate: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
