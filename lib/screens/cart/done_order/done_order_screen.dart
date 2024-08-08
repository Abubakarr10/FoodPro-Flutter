import 'package:flutter/material.dart';
import 'package:food_pro/constant/images.dart';
import 'package:food_pro/screens/cart/done_order/DoneOrderController.dart';
import 'package:get/get.dart';

import '../../../constant/app_size.dart';

class DoneOrderScreen extends GetView<DoneOrderController> {
  const DoneOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoneOrderController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: heightX * 0.3,
          width: widthX * 0.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: const DecorationImage(image: AssetImage(doneOrderGif),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high
              )
          ),
        ),
      ),
    );
  }
}
