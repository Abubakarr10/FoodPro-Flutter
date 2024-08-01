import 'package:hive/hive.dart';

part 'food_model.g.dart';

@HiveType(typeId: 0)
class FoodModel extends HiveObject{
  @HiveField(0) String name;
  @HiveField(1) String description;
  @HiveField(2) String calories;
  @HiveField(3) String price;
  @HiveField(4) double quantity;
  @HiveField(5) String image;
  @HiveField(6) String type;
  @HiveField(7) List<String> ingredients;

  FoodModel({
    required this.name,
    required this.description,
    required this.type,
    required this.calories,
    required this.price,
    required this.quantity,
    required this.image,
    required this.ingredients
  });
}