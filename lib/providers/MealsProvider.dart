import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_application/data/dummyData.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
