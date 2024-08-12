// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/widgets/snackbar_widget.dart';
import 'package:get/get.dart';

import '../../boxes/boxes.dart';
import '../../constant/food_list.dart';
import '../../model/food_model.dart';

class FoodDetailService extends GetxService{

  RxBool isFavourite = false.obs;
  RxBool favBounce = false.obs;
  RxInt qty = RxInt(1);
  RxBool checked = RxBool(false);
  late RxInt itemsInCart = getFoodData().length.obs;
  RxList<FoodModel> favFoodList = RxList([]);

  var favBox = getFavData().values.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    itemsInCart.value = getFoodData().length;
    super.onInit();
  }

  void decrement(){
    if(qty.value > 1){
      qty.value -= 1;
      checked.value = false;
    }
  }

  void increment(){
    if(qty.value < 20) {
      qty.value += 1;
      checked.value = true;
    }
  }


  // >>>>>>>>>>>>>> Favourite <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


  bool checkFavItem(FoodModel foodData){
    var favBox = getFavData();
    int index = favBox.values.toList().indexWhere((element) => element.name == foodData.name);
    if(index>=0){
       isFavourite.value = true;
    }
    if(isFavourite.value == true && index >= 0){
      if (kDebugMode) {print("Yes that's TRUE");}
      favBounce.value = true;
      return true;
    }else{
      if (kDebugMode) {print("Yes that's FALSE");}
      favBounce.value = false;
      return false;
    }
  }

  void clearFavData(){
    var favBox = getFavData();
    favBox.clear();
  }

  // Function: To mark Item as Fav or remove from fav
  void actionFavList(FoodModel foodData){
    var favBox = getFavData();
    int index = favBox.values.toList().indexWhere((element) => element.name == foodData.name);

    if(isFavourite.value == false && index>=0){
      if (kDebugMode) {print("Yes! This item is contained");}
      removeFromFavouriteList(foodData);
    } else{
      if (kDebugMode) {print("OOPs! This item is not contained");}
      addToFavouriteList(foodData);
    }
  }

  // Function: Add Item to Fav List
  void addToFavouriteList(FoodModel foodData)async{

    var box =  getFavData();

    if(favBox.value.contains(foodData)){
      if (kDebugMode) {
        print('That item already exit in Fav Box');
      }
    }else{
    await box.add(foodData);
    await foodData.save();

    Fluttertoast.showToast(msg: 'Added to Favourite ❤️',
    backgroundColor: mainColor,
      textColor: pureBlack,
      gravity: ToastGravity.TOP
    );

    if (kDebugMode) {
      print('FoodList => ${getFavData().values.toList().length}');
    }
    }
  }

  // Function: Remove Item from fav List
  void removeFromFavouriteList(FoodModel foodData)async{

    var favBox = getFavData();

    int index = favBox.values.toList().indexWhere((element) => element.name == foodData.name);
    await favBox.deleteAt(index).whenComplete((){
      Fluttertoast.showToast(msg: 'Remove Favourite 💔',
          backgroundColor: pureBlack,
          textColor: mainColor,
          gravity: ToastGravity.TOP
      );
    });

    if (kDebugMode) {print('FoodList => ${getFavData().values.toList().length}');}
  }

  // >>>>>>>>>>>>>> Add To Cart <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

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