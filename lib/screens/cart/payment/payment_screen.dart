import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                SizedBox(height: heightX*.008,),

                // Image: Card | Button: Add
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Image: Card Image
                    Container(
                      height: heightX*.200,
                      width: widthX*.65,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(dummyMasterCardImage),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ).animate().shimmer(delay: 200.ms),

                    // Button: Add Button
                    AddButtonWidget(onTap: () {  },)
                  ],
                ),
                SizedBox(height: heightX*.025,),

                // Text Title: Add New Cards
                const Text(
                  "Add New Cards",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5,),

                // List: List of Cards
                Column(
                  children: List.generate(controller.cardLists.length, (index){
                    return Obx(()=> CardTileWidget(
                      img: controller.cardLists.values.elementAt(index),
                      type: controller.cardLists.keys.elementAt(index),
                      onTap: () {
                        controller.selectedCard.value = index;
                        controller.choosePayment.value
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

      // FAB: Done
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: () {
            Get.offNamed(cartScreen,arguments: controller.choosePayment.value);
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
