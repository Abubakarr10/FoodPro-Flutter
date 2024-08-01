// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_pro/constant/filter_list.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:get/get.dart';

import '../../constant/food_list.dart';
import '../../model/food_model.dart';

class HomeController extends GetxController{

  RxList filteredList = [].obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxInt currentSelection = RxInt(0);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    filter();
  }


  void filter(){
    filteredList.value = [];

    if(currentSelection.value != 0 && currentSelection.value != 1){
      filteredList.addAll(filterFoodList(filterList.elementAt(currentSelection.value)));
    }else if(currentSelection.value == 1){
      filteredList.addAll(FoodDetailService().favFoodList);
    }else if(currentSelection.value == 2 || currentSelection.value == 3 || currentSelection.value == 4){
      filteredList.addAll(foodList);
    }else{
      searchResult(searchController.value.text);
    }
  }

  List<FoodModel> filterFoodList(String type) {
    if (kDebugMode) {
      print('List =>> ${foodList.where((food) => food.type == type).cast<FoodModel>().toList()}');
    }
    return foodList.where((food) => food.type == type).toList();
  }


  void searchResult(String query){
    filteredList.addAll(searchFoodList(query));
  }

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