import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:get/get.dart';

import '../../../model/food_model.dart';

class OnlyImageScreen extends StatelessWidget {
  const OnlyImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FoodModel foodData = Get.arguments;
    return Scaffold(
      backgroundColor: pureBlack,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.offNamed(foodDetailScreen,arguments: foodData);
          },
        backgroundColor: pureBlack,
        child: const Icon(Icons.close,color: mainColor,),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: mainColor,
          gradient: LinearGradient(colors: [mainColor.withOpacity(0.8),mainColor],
          begin: Alignment.bottomCenter, end: Alignment.topCenter
          ),
        ),
        child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(20),
            minScale: 0.5,
            maxScale: 4.0,
            child: Hero(
                tag: 'FoodHero',
                child: Image.asset(foodData.image))),
      ),
    );
  }
}
