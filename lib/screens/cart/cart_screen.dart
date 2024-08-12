import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_pro/boxes/boxes.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/constant/images.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:food_pro/model/food_model.dart';
import 'package:food_pro/screens/cart/CartController.dart';
import 'package:food_pro/screens/cart/widget/defult_dialog_widget.dart';
import 'package:food_pro/screens/cart/widget/empty_cart_widget.dart';
import 'package:food_pro/screens/cart/widget/item_card_widget.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:food_pro/screens/cart/payment/payment_screen.dart';
import 'package:food_pro/screens/home/home_screen.dart';
import 'package:food_pro/widgets/snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../constant/app_size.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    FoodDetailService fdController = Get.find();
    controller.choosePayment.value = Get.arguments ?? 'COD';

    return SizedBox(
      child:  controller.data.length != 0.0?
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.offNamed(homeScreen);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: heightX*.026,
            ),
          ),
          title: Text('My Cart',style: TextStyle(
              fontSize: fontX*.024, fontWeight: FontWeight.w600
          ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [

                // Custom List: Cart Lists
                Flexible(
                  flex: 8,
                  child: ValueListenableBuilder<Box<FoodModel>>(
                    valueListenable: getFoodData().listenable(),
                    builder: (context,box,_){
                      var data = controller.data.values.toList().cast<FoodModel>();
                      controller.totalAmount.value = data.fold(
                        0.0,
                            (previousValue, element) =>
                        previousValue + (double.parse(element.price) * element.quantity),
                      );

                      return controller.data.length != 0? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context,index){
                            double? price = double.tryParse(data.elementAt(index).price);
                            double quantity = data.elementAt(index).quantity;

                            double total = price != null ? price * quantity : 0.0;
                            return InkWell(
                              onTap: (){
                                buildDefaultDialog(data, index, total);
                              },
                              child: ItemCardWidget(
                                  name: data.elementAt(index).name,
                                  price: total.floor().toString(),
                                  quantity: data.elementAt(index).quantity.floor().toString(),
                                  image: data.elementAt(index).image,
                                removeOnTap: (){
                                    if(data.length == 1){
                                      handleRemoveItem(controller,index);
                                      fdController.itemsInCart.value = box.length;
                                      Get.back();
                                    }else {
                                        handleRemoveItem(controller, index);
                                        fdController.itemsInCart.value = box.length;
                                    }
                                },
                              ).animate().fadeIn(delay: 200.ms).moveX(),
                            );
                          }) : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(emptyCartImage),
                          Text('Your Cart is Empty :(',style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: fontX*.024
                          ),)
                        ],
                      );
                    },
                  ),
                ),

                // End: Bottom Widget
                Flexible(
                  flex: 3,
                    child: Container(
                      width: widthX,
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: Colors.amber,
                            thickness: 5,
                          ),

                          // Text: Choose Payment Method
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: Text('Choose Payment Method',
                              style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: fontX*.022,
                              ),
                            ),
                          ),

                          // ListTile: Payment Type | Icon: Forward arrow
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ListTile(
                              onTap: (){
                                Get.offNamed(paymentScreen);
                              },
                              title: Obx(()=>
                                  Text(controller.choosePayment.value,
                                    style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: fontX*.020,
                                  ),),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                color: Colors.amber[600],),
                            ),
                          ),

                          // Text: Total Amount
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Amount',
                                  style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: fontX*.022,
                                ),),
                                Row(
                                  children: [
                                    Text('Rs ',
                                      style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: fontX*.022,
                                        color: Colors.amber
                                    ),),
                                    Obx(()=>
                                        Text(controller.totalAmount.floor().toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: fontX*.022,
                                      ),),),

                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ).animate().fadeIn(duration: 600.ms)
                        .then(delay: 200.ms) // baseline=800ms
                        .slide())
              ],
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
          child: ElevatedButton(
            onPressed: () {

              Get.offNamed(doneOrderScreen);

              var box = getFoodData();
              box.clear();

              snackBarWidget('Yes!', 'Your order is placed Successfully',
                position: SnackPosition.TOP);

              fdController.itemsInCart.value = 0;

            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(widthX, heightX*.06),
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              "Confirm Order",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        )
            .animate().fadeIn(duration: 600.ms)
            .then(delay: 200.ms) // baseline=800ms
            .slideY(curve: Curves.bounceOut,delay: 300.ms),
      )
          : const EmptyCartWidget(),
    );
  }
}

