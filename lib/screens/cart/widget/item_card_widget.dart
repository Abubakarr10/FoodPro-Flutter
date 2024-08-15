import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_pro/constant/app_size.dart';

class ItemCardWidget extends StatelessWidget {
  final String name,price,quantity,image;
  final VoidCallback removeOnTap;
  const ItemCardWidget({
    super.key, required this.name, required this.price, required this.quantity, required this.image, required this.removeOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: heightX*.010,left: 20,right: 20),
      child: SizedBox(
        height: heightX*.15,
        child: Card(
            elevation: 5,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:  const Border(
                  top: BorderSide(
                    color: Colors.amber,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Colors.amber, // Right border color
                    width: 1, // Right border width
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(image,height: heightX*.12,width: heightX*.12,
                  fit: BoxFit.contain,
                  ).animate().shake(delay: 400.ms),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text: Item Name
                      Text(name,style: TextStyle(
                          fontSize: fontX*.022, fontWeight: FontWeight.w600
                      ),),

                      Text("Tap to see Item's Details ",style: TextStyle(
                          fontSize: fontX*.012,color: Colors.grey ,
                          fontWeight: FontWeight.w600
                      ),).animate().tint(color: Colors.white,
                      delay: 2.seconds
                      ),

                      // Text: Price
                      Row(
                        children: [
                          Text('Rs ',style: TextStyle(
                            fontSize: fontX*.026, fontWeight: FontWeight.w600,
                            color: Colors.amber[300],
                          ),),
                          Text(price,style: TextStyle(
                              fontSize: fontX*.03, fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          removeOnTap();
                        },
                        child: const Icon(Icons.close,
                          color: Colors.grey,),
                      ),
                      const Spacer(),
                      Text('Qty x $quantity',style: TextStyle(
                          fontSize: fontX*.014, fontWeight: FontWeight.w400
                      ),),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
