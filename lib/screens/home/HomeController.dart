// ignore_for_file: file_names, unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_pro/boxes/boxes.dart';
import 'package:food_pro/constant/filter_list.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:food_pro/screens/food_detail/food_detail_screen.dart';
import 'package:get/get.dart';

import '../../constant/food_list.dart';
import '../../model/food_model.dart';

class HomeController extends GetxController{

 // FoodDetailService fdController = Get.find<FoodDetailService>();

  RxList filteredList = [].obs;
  late TextEditingController searchController;

  RxInt currentSelection = RxInt(0);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void onInit() {
    // TODO: implement onInit
  //  fdController.onInit();
    searchController = TextEditingController();
    super.onInit();
    filter();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.dispose();
  }

  // Function: To Filter food types
  void filter(){
    filteredList.value = [];
    filteredList.addAll(foodList);

      if(currentSelection.value != 0 && currentSelection.value != 1){
        filteredList.value = [];
        // Adding Filter: Desi, Chinese, Fast Food
        filteredList.addAll(filterFoodList(filterList.elementAt(currentSelection.value)));
      }else if(currentSelection.value == 1){
        filteredList.value = [];
        var favBox = getFavData().values.toList().cast<FoodModel>();
        // Adding: Favourites
        filteredList.addAll(favBox);

        if (kDebugMode) {
          print('Filter List => $filteredList');
        }
      }else if(currentSelection.value == 0){
        filteredList.value = [];
        filteredList.addAll(foodList);
      }else{
        filteredList.value = [];
        filteredList.addAll(foodList);
      }
  }

  // Return Value Function: Filtering Food types
  List<FoodModel> filterFoodList(String type) {
    if (kDebugMode) {
      print('List =>> ${foodList.where((food) => food.type == type).cast<FoodModel>().toList()}');
    }
    return foodList.where((food) => food.type == type).toList();
  }

  // Function: Search Result
  void searchResult(){
    filteredList.value = [];
    filteredList.addAll(searchFoodList(searchController.value.text));
  }

  // Return Value Function: Fetching query from Food List
  List<FoodModel> searchFoodList(String query) {
    final filtered = foodList.where((food) {
      final foodNameLower = food.name.toLowerCase();
      final foodTypeLower = food.type.toLowerCase();
      final searchLower = query.toLowerCase();

      return foodNameLower.contains(searchLower) || foodTypeLower.contains(searchLower);
    }).toList();

    return filtered;
  }

}