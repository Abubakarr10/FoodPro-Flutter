// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/widgets/snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../boxes/boxes.dart';
import '../../constant/food_list.dart';
import '../../model/food_model.dart';

class FoodDetailService extends GetxService{

  RxBool isFavourite = false.obs;
  RxInt qty = RxInt(1);
  RxInt itemsInCart = RxInt(0);
  RxList<FoodModel> favFoodList = RxList([]);

  Future<FoodDetailService> init() async {

   getFoodData();
   // itemsInCart.value = box.length;

    return this;
  }

  void decrement(){
    if(qty.value > 1){
      qty -= 1;
    }
  }

  void increment(){
    if(qty.value < 20) {
      qty += 1;
    }
  }

  bool checkFavItem(FoodModel foodData){

    if(favFoodList.contains(foodData)){
      if (kDebugMode) {
        print("Yes that's TRUE");
      }
      return true;
    }else{
      false;
    }
    return false;
  }

  // Function: To mark Item as Fav or remove from fav
  void actionFavList(FoodModel foodData){

    if(isFavourite.value == true){
      addToFavouriteList(foodData);
    }else{
      removeFromFavouriteList(foodData);
    }
  }

  // Function: Add Item to Fav List
  void addToFavouriteList(FoodModel foodData){
    favFoodList.add(foodData);

    snackBarWidget('My Lovely Food!', 'Added to Favourite List',
    textColor: pureBlack, bgColor: mainColor
    );

    if (kDebugMode) {
      print('FoodList => $favFoodList');
    }
  }

  // Function: Remove Item from fav List
  void removeFromFavouriteList(FoodModel foodData){
    favFoodList.remove(foodData);
    if (kDebugMode) {
      print('FoodList => $favFoodList');
    }
  }

  // Function: Add Item to Cart
  Future<void> addToCart(FoodModel foodData)async{

    var cartBox = getFoodData();
    int index = cartBox.values.toList().indexWhere((element) => element.name == foodData.name);


    if(foodData.quantity >= qty.value){
      final box = getFoodData();

      // Calling function: To update quantity
      updateQuantity(foodData.name, qty.value.toDouble());

      if (index != -1) {
        // Item exists, increase the quantity
        var existingItem = cartBox.getAt(index);
        existingItem?.quantity += qty.value.toDouble();
        existingItem?.save();
        snackBarWidget('Successfully Added Quantity',
            '${foodData.name.toString()} added ${qty.value} in your cart');
      } else {
        FoodModel cartData = FoodModel(
            name: foodData.name,
            description: foodData.description,
            type: foodData.type,
            calories: foodData.calories,
            price: foodData.price,
            quantity: qty.value.toDouble(),
            image: foodData.image,
            ingredients: foodData.ingredients);

        await box.add(cartData);
        await cartData.save();

        itemsInCart.value = box.length;

      //   if (kDebugMode) {
      //     print('ItemsInCart value => ${itemsInCart.value}');
      //   }

        snackBarWidget('Successfully Added',
            '${foodData.name.toString()} added to your cart');
      }
    }else{
      snackBarWidget('Oops!', 'Not enough quantity available for ${foodData.name}',
          position: SnackPosition.TOP,
          bgColor: pureBlack, textColor: alertColor
      );
    }
  }

  // Function: Updating quantity of the item
  void updateQuantity(String foodName, double orderedQuantity) {
    for (var food in foodList) {
      if (food.name == foodName) {
        if (food.quantity >= orderedQuantity) {
          food.quantity -= orderedQuantity;
          if (kDebugMode) {
            print('Quantity updated for ${food.name}. New quantity: ${food.quantity}');
          }
        } else {
          if (kDebugMode) {
            print('Not enough quantity available for ${food.name}');
          }
        }
        break;
      }
    }
  }

}