// ignore_for_file: file_name
import 'package:food_pro/constant/images.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

  late int value;
  late RxInt selectedCard;

  RxString choosePayment = 'COD'.obs;

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
      if(cardLists.keys.elementAt(x).contains(choosePayment.value)){
        return x;
      }
    }
    return 3;
  }

}