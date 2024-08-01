
import 'package:hive/hive.dart';
import '../model/food_model.dart';

Box<FoodModel> getFoodData()=> Hive.box<FoodModel>('Food');