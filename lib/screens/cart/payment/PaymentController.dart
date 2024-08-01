// ignore_for_file: file_names

import 'package:food_pro/constant/images.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

  Map<String,String> cardLists = {
    'Google Pay' : googleIcon,
    'Credit Card' : masterCardIcon,
    'Apple Pay' : appleIcon,
    'Cash On Delivery' : codIcon,
  };


  RxInt selectedCard = RxInt(0);



}