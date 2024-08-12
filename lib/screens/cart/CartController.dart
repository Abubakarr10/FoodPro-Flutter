// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:food_pro/model/food_model.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:get/get.dart';

import '../../boxes/boxes.dart';

class CartController extends GetxService{


  // ignore: prefer_typing_uninitialized_variables
  var data;
  RxDouble totalAmount = RxDouble(0);
  RxString choosePayment = 'COD'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = getFoodData();
    var foodData = data.values.toList().cast<FoodModel>();
    if (kDebugMode) {
      print('GetFoodData => $foodData');
      print('GetFoodData Length => ${getFoodData().length}');
    }
  }

  // Function: Add Amount to Total
  void addToTotalAmount(var data){
    totalAmount.value = data.fold(
      0,
          (previousValue, element) =>
      previousValue + (double.parse(element.price) * element.quantity),
    );
  }

  // Function: Remove Amount from Total
  void removeFromTotalAmount(var amount){

    double price = double.parse(amount);

    totalAmount.value -= price;
    if (kDebugMode) {
      print('Total Amount => ${totalAmount.value}');
    }
  }

  // Function: Delete Item From Cart
  void delete(int index)async{
    var boxLength = getFoodData().length;
    var box = getFoodData();

    //await foodModel.delete();
    await box.deleteAt(index);

    if (kDebugMode) {
      print('Items in Cart => $boxLength');
    }
  }
}

// Function: To Handle State while removing item from cart
void handleRemoveItem(CartController controller,int index) {
  controller.totalAmount.value = 0;
  controller.delete(index);

  final box = getFoodData();
  final data = box.values.toList().cast<FoodModel>();
  controller.totalAmount.value = data.fold(
    0,
        (previousValue, element) => previousValue + (double.parse(element.price) * element.quantity),
  );
}
