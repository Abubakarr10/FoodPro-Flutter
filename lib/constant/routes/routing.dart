import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:food_pro/model/food_model.dart';
import 'package:food_pro/screens/cart/cart_screen.dart';
import 'package:food_pro/screens/cart/done_order/done_order_screen.dart';
import 'package:food_pro/screens/cart/payment/payment_screen.dart';
import 'package:food_pro/screens/food_detail/food_detail_screen.dart';
import 'package:food_pro/screens/food_detail/only_image/only_image_screen.dart';
import 'package:food_pro/screens/home/home_screen.dart';
import 'package:food_pro/screens/practice/expansion_tile_widget.dart';
import 'package:food_pro/screens/practice/sliver_aapBar_widget.dart';
import 'package:food_pro/screens/splash_screen.dart';
import 'package:get/get.dart';

final pages = [

  ///============================== Splash =====================================
  GetPage(name: splashScreen, page: () => const SplashScreen()),

  ///=============================== Home ======================================
  GetPage(name: homeScreen, page: () => const HomeScreen(),),

  ///============================ Food Detail ==================================
  GetPage(name: foodDetailScreen, page: () => const FoodDetailScreen(),
      arguments: FoodModel ),
  // Only Image
  GetPage(name: onlyImageScreen, page: () => const OnlyImageScreen(),
      arguments: FoodModel),

  ///=============================== Cart ======================================
  GetPage(name: cartScreen, page: () => const CartScreen(),
    arguments: String
  ),
  // Payments
  GetPage(name: paymentScreen, page: () => const PaymentScreen()),
  // Done Order
  GetPage(name: doneOrderScreen, page: () => const DoneOrderScreen()),


];