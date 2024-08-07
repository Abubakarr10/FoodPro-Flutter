import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/constant/app_size.dart';
import 'package:food_pro/constant/images.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:food_pro/model/food_model.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:food_pro/screens/food_detail/widgets/food_info_widget.dart';
import 'package:food_pro/widgets/add_button_widget.dart';
import 'package:get/get.dart';

class FoodDetailScreen extends GetView<FoodDetailService> {
  const FoodDetailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodDetailService());
    FoodModel foodData = Get.arguments;
    controller.checkFavItem(foodData);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // App Bar>>
                SizedBox(
                  height: heightX*.003,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offNamed(homeScreen);
                        controller.qty.value = 1;
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: heightX*.03,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: (){
                          Get.toNamed(cartScreen);
                          controller.qty.value = 1;
                        },
                        child: Obx(()=>
                            SizedBox(
                          child: controller.itemsInCart.value != 0? Badge(
                              offset: const Offset(7, -5),
                              backgroundColor: mainColor,
                              label: Text(
                                controller.itemsInCart.value.toString(),style:
                              const TextStyle(fontWeight: FontWeight.w600,color: pureBlack),
                              ),
                              child: Icon(Icons.shopping_cart_outlined,
                                size: heightX*.03,)) :
                           Icon(Icons.shopping_cart_outlined, size: heightX*.03,)
                          ,
                        )
                        )),
                    const SizedBox(width: 10,),

                    Obx(()=>
                        GestureDetector(
                          onTap: (){
                            controller.isFavourite.value = !controller.isFavourite.value;
                            controller.actionFavList(foodData);
                            if (kDebugMode) {
                              print('check Favourite => ${controller.checkFavItem(foodData)}');
                              print('isFavourite => ${controller.isFavourite.value}');
                            }
                          },
                          child:  controller.checkFavItem(foodData) ==  true? Icon(
                            Icons.favorite,
                            size: heightX*.03,
                            color: Colors.red,
                          )
                              : Icon(
                            Icons.favorite_outline,
                            size: heightX*.03,
                            color: Colors.amber,
                          ),
                        )
                    ),

                  ],
                ),
                SizedBox(
                  height: heightX*.015,
                ),
                // <<App Bar

                Container(
                  height: heightX*.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(foodData.image),fit: BoxFit.contain,
                    filterQuality: FilterQuality.high
                    )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Container(
                      width: widthX*.35,
                      height: heightX*.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29.0),
                        color: Colors.amber[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber[300]!,
                            blurRadius: 5.0,
                          )
                        ],
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.decrement();
                            },
                            child: Icon(CupertinoIcons.minus,size: heightX*.03,)
                          ),
                          Obx(()=> Text(controller.qty.value.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: fontX*.028),
                          ),),
                          InkWell(
                            onTap: () {
                              controller.increment();
                            },
                            child: Icon(CupertinoIcons.add,size: heightX*.03,)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Text: Rs | Item Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        foodData.name,
                        style: TextStyle(
                            fontSize: fontX*.026, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children:[
                        Text(
                          "Rs ",
                          style: TextStyle(
                              fontSize: fontX*.018,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber),
                        ),
                        Text(
                          foodData.price.toString(),
                          style: TextStyle(
                              fontSize: fontX*.028, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FoodInfoWidget(icon: starIcon, value: "4.6"),
                      FoodInfoWidget(
                          icon: caloriesIcon,
                          value: "${foodData.calories} Calories"),
                      const FoodInfoWidget(
                          icon: timeIcon, value: "20-30 Min"),
                    ],
                  ),
                ),
                const Text(
                  "Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: heightX*.005,
                ),
                Text(
                  foodData.description,
                ),
                SizedBox(
                  height: heightX*.015,
                ),
                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: heightX*.005,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      foodData.ingredients.length,
                      growable: true,
                          (int index){
                        return Text("🟡 ${foodData.ingredients.elementAt(index)}");
                      }),
                )

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AddButtonWidget(
        height: heightX*.065,
        width: heightX*.065,
        onTap: () {
          controller.addToCart(foodData);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
