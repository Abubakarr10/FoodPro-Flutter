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

import 'widgets/increment_button_widget.dart';

class FoodDetailScreen extends GetView<FoodDetailService> {
  const FoodDetailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodDetailService());
    FoodModel foodData = Get.arguments;

    return Scaffold(
      appBar: AppBar(

        // Icon: Back Arrow
        leading: InkWell(
          onTap: () {
            Get.offNamed(homeScreen);
            controller.qty.value = 1;
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: heightX*.03,
          ),
        ),

        // Icons: Cart | Favourite
        actions: [
          // Icon: Cart
          InkWell(
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
          const SizedBox(width: 15,),

          // Icon: Favourite
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
          const SizedBox(width: 20,),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Image: Food
                Container(
                  height: heightX*.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(foodData.image),fit: BoxFit.contain,
                    filterQuality: FilterQuality.high
                    )
                  ),
                ),

                // Custom Button: Increment
                IncrementButtonWidget(controller: controller),

                // Text: Rs | Item Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(

                      // Text: Food Title
                      child: Text(
                        foodData.name,
                        style: TextStyle(
                            fontSize: fontX*.026, fontWeight: FontWeight.w600),
                      ),
                    ),

                    // Text: Price
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

                // Row: Info Icons | Values
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

                // Text: Details
                const Text(
                  "Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: heightX*.005,),

                // Text: Item Description
                Text(foodData.description,),
                SizedBox(height: heightX*.015,),

                // Text: Ingredients
                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: heightX*.005,),

                // List: Item's Ingredients
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

      // Button: Add to Cart
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
