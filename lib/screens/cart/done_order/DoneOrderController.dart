import 'dart:async';

import 'package:get/get.dart';

import '../../../constant/routes/screen_names.dart';

class DoneOrderController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(homeScreen);
    });
  }

}