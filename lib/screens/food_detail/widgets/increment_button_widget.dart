import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../constant/app_size.dart';
import '../FoodDetailService.dart';

class IncrementButtonWidget extends StatelessWidget {
  const IncrementButtonWidget({
    super.key,
    required this.controller,
  });

  final FoodDetailService controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: Container(
          width: widthX*.35,
          height: heightX*.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29.0),
            color: Colors.amber[300],
            boxShadow: [
              BoxShadow(
                color: Colors.amber[300]!,
                blurRadius: 5.0,
              )
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    controller.decrement();
                  },
                  child: Icon(CupertinoIcons.minus,size: heightX*.03,)
              ),
              Obx(()=> Text(controller.qty.value.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: fontX*.028),
              ),),
              InkWell(
                  onTap: () {
                    controller.increment();
                  },
                  child: Icon(CupertinoIcons.add,size: heightX*.03,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
