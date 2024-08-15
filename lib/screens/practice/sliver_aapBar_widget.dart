import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_colors.dart';
import 'package:food_pro/constant/images.dart';

class SliverAapBarWidget extends StatelessWidget {
  const SliverAapBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            title: const Text('Flutter'),
            backgroundColor: mainColor,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver AppBar'),
              background: Image.asset(foodBgImage,fit: BoxFit.cover,),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Text('Abubakar'.toUpperCase(),
                    style: const TextStyle(fontSize: 600),
                    )
                    ]
          ))
        ],
      ),
    );
  }
}
