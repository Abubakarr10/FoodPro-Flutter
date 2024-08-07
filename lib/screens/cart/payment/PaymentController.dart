// ignore_for_file: file_names

import 'package:food_pro/constant/images.dart';
import 'package:food_pro/screens/cart/CartController.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

  CartController cartController = Get.find();
  late int value;
  late RxInt selectedCard;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    value = selectedOption();
    selectedCard = value.obs;
  }

  Map<String,String> cardLists = {
    'Google Pay' : googleIcon,
    'MasterCard' : masterCardIcon,
    'Apple Pay' : appleIcon,
    'Cash On Delivery' : codIcon,
  };


  int selectedOption(){
    for(int x=0; x<cardLists.length; x++){
      if(cardLists.keys.elementAt(x).contains(cartController.choosePayment.value)){
        return x;
      }
    }
    return 3;
  }

}