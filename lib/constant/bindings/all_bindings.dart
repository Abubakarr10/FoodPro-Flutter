
import 'package:food_pro/screens/cart/CartController.dart';
import 'package:food_pro/screens/cart/done_order/DoneOrderController.dart';
import 'package:food_pro/screens/cart/payment/PaymentController.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:food_pro/screens/home/HomeController.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{

  AllBindings();
  @override
  void dependencies() {
    Get.lazyPut(()=> HomeController());
    Get.lazyPut(()=> FoodDetailService());
    Get.lazyPut(()=> CartController());
    Get.lazyPut(()=> PaymentController());
    Get.lazyPut(()=> DoneOrderController());
  }

}