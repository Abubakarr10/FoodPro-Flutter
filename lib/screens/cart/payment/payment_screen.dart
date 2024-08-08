import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_size.dart';
import 'package:food_pro/constant/images.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:food_pro/screens/cart/payment/PaymentController.dart';
import 'package:food_pro/screens/food_detail/widgets/card_title_widget.dart';
import 'package:food_pro/widgets/add_button_widget.dart';
import 'package:get/get.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.offNamed(cartScreen);
            },
            child: Icon(Icons.arrow_back_ios_new,size: heightX*.03,)),
        centerTitle: true,
        title: Text('My Cards',
        style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: fontX*.024,
        ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightX*.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Image: Card Image
                    Container(
                      height: 180.0,
                      width: 300.0,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(dummyMasterCardImage),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    AddButtonWidget(onTap: () {  },)
                  ],
                ),
                SizedBox(
                  height: heightX*.025,
                ),
                const Text(
                  "Add New Cards",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),

                Column(
                  children: List.generate(controller.cardLists.length, (index){
                    return Obx(()=> CardTileWidget(
                      img: controller.cardLists.values.elementAt(index),
                      type: controller.cardLists.keys.elementAt(index),
                      onTap: () {
                        controller.selectedCard.value = index;
                        controller.cartController.choosePayment.value
                        = controller.cardLists.keys.elementAt(index);
                      },
                      icon: controller.selectedCard.value == index?
                      Icon(Icons.radio_button_checked,
                          color: Colors.amber[400])
                          :
                      const Icon(Icons.radio_button_off,
                        color: Colors.grey,),
                    ));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            Get.offNamed(cartScreen);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 50), backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            "Done",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
