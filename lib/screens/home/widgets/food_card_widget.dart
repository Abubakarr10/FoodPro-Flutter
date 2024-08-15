import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_pro/constant/app_size.dart';
import 'package:food_pro/constant/images.dart';
import '../../../model/food_model.dart';

class FoodCardWidget extends StatelessWidget {
  final FoodModel foodData;

  const FoodCardWidget({super.key, required this.foodData});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 15.0,
            spreadRadius: 0.5,
            offset: const Offset(
              3.0,
              3.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            // Image: Food Image
            Container(
              height: heightX*.14,
              decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius:  BorderRadius.all(Radius.circular(12))
              ),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(foodData.image,fit: BoxFit.contain,)
            ).animate().slide(delay: 200.ms),
            SizedBox(height: heightX*.010,),

            // Text: Food Title
            Text(
              foodData.name,
              style:  TextStyle(fontSize: fontX*.018, fontWeight: FontWeight.w600),
            ),

            // Text: Food Description
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                foodData.description,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(fontSize: fontX*.014, color: Colors.grey[500],
                ),
              ),
            ),

            // Icon | Text: Food Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  caloriesIcon,
                  height: heightX*.014,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "${foodData.calories} Calories",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 11,
                  ),
                )
              ],
            ),

            SizedBox(height: heightX*.005,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  "Rs ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber),
                ),
                Text(
                  foodData.price.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: heightX*.030,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
