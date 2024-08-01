import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_size.dart';

class FoodInfoWidget extends StatelessWidget {
  final String icon;
  final String value;

  const FoodInfoWidget({
    super.key,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          height: heightX*.018,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: TextStyle(fontSize: fontX*.016),
        )
      ],
    );
  }
}
