import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/constant/images.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:get/get.dart';

import '../constant/app_size.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          width: widthX,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(foodBgImage),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: heightX * 0.3,
                width: widthX * 0.6,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60),
                    image: const DecorationImage(image: AssetImage(foodLogoImage),
                        fit: BoxFit.contain,
                      filterQuality: FilterQuality.high
                    )
                ),
              ),
              SizedBox(height: heightX * 0.004,),
              Text('food pro'.toUpperCase(), style: TextStyle(
                  letterSpacing: 0.6, color: pureBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: fontX*.046
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
