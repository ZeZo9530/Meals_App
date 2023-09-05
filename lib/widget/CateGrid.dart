import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:second_application/main.dart';
import 'package:second_application/models/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(
      {super.key, required this.category, required this.onSelectCate});

  final Category category;
  final void Function() onSelectCate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onSelectCate,
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
