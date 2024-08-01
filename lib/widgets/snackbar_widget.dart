import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackBarWidget(String title, String message,
{SnackPosition position = SnackPosition.BOTTOM,
  Color textColor = Colors.black, Color bgColor = Colors.amber,
}){

  return Get.snackbar(
    title,
    message,
    snackPosition: position,
    backgroundColor: bgColor,
    colorText: textColor,
  );
}

