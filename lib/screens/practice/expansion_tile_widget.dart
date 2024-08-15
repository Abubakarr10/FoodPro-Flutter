import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/constant/app_size.dart';
import 'package:get/get.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Expansion Tile'),
        backgroundColor: mainColor,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Card(
              child: ExpansionTile(
                  title: Text('Look more'),
                leading: Tooltip(
                    message: 'More Info',
                    child: Icon(Icons.info)),
                backgroundColor: mainColor,
                children: [
                  ListTile(title: Text('First'),),
                  ListTile(title: Text('Second'),),
                  ListTile(title: Text('Third'),)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Card(
              child: ExpansionTile(
                  title: Text('Look more'),
                leading: Icon(Icons.info),
                backgroundColor: mainColor,
                children: [
                  ListTile(title: Text('First'),),
                  ListTile(title: Text('Second'),),
                  ListTile(title: Text('Third'),)
                ],
              ),
            ),
            const SizedBox(height: 20,),

            Container(
              height: heightX*.150,
              width: heightX*.300,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: mainColor,
              ),
              child: const FittedBox(
                child: Text('Abubakar Flutter',style: TextStyle(
                  fontSize: 100, fontWeight: FontWeight.bold
                ),),
              ),
            )



          ],
        ),
      ),
    );
  }
}
