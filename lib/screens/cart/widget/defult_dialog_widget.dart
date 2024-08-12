import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_size.dart';

Future<dynamic> buildDefaultDialog(data, int index, double total) {
  return Get.defaultDialog(
    title: data.elementAt(index).name,
    contentPadding: const EdgeInsets.all(20),
    content: Column(
      children: [
        Image.asset(data.elementAt(index).image),
        const Divider(thickness: 2,color: mainColor,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Unit Price',
                style: TextStyle(fontSize: fontX*.020),),
              Text(data.elementAt(index).price,
                style: TextStyle(fontSize: fontX*.020,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quantity',
                style: TextStyle(fontSize: fontX*.020),),
              Text(data.elementAt(index).quantity.floor().toString(),
                style: TextStyle(fontSize: fontX*.020,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Item Price',
                style: TextStyle(fontSize: fontX*.020),),
              Text(total.floor().toString(),
                style: TextStyle(fontSize: fontX*.020,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}