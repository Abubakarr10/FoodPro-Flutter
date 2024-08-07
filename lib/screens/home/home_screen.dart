import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_pro/constant/app_size.dart';
import 'package:food_pro/constant/filter_list.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:food_pro/screens/food_detail/FoodDetailService.dart';
import 'package:food_pro/screens/home/HomeController.dart';
import 'package:food_pro/screens/home/widgets/filter_widget.dart';
import 'package:food_pro/screens/home/widgets/food_card_widget.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../constant/images.dart';

class HomeScreen extends GetView<HomeController> {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            // Drawer Header> Text: Food Pro | Image: food_bg
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber[600],
                image: const DecorationImage(image: AssetImage(foodBgImage),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)
              ),
              child: Text('food pro'.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 5,
                  fontSize: fontX*.026,
                  fontWeight: FontWeight.bold
                ),),
            ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),

           // Text: Filter
           Obx(()=>
               Text('  Filter: ${filterList[controller.currentSelection.value]}',
                 style: TextStyle(
                   fontSize: fontX*.020, fontWeight: FontWeight.w600
                 ),),
           ),

            const SizedBox(height: 10,),

            // Package: ChipList for Filters
            Obx(()=>
                ChipList(
                shouldWrap: true,
                listOfChipNames: filterList,
                showCheckmark: false,
                elevation: 2,
                activeBgColorList: [Colors.amber[600]!],
                inactiveBgColorList: const [Colors.white],
                activeTextColorList: const [Colors.white],
                inactiveTextColorList: [Theme.of(context).primaryColor],
                listOfChipIndicesCurrentlySelected: [controller.currentSelection.value],
                extraOnToggle: (value) {
                  controller.currentSelection.value = value;
                  controller.filter();
                  controller.searchController.text = '';
                }
            )),
          ],
        ),
      ),

      ]
    ),
      ),

      // Button: View Cart
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(cartScreen);
          },
        backgroundColor: Colors.amber,
        child: GetX<FoodDetailService>(
          builder: (FoodDetailService fdController) =>
              SizedBox(
                child: fdController.itemsInCart.value != 0? Badge(
                    offset: const Offset(7, -5),
                    backgroundColor: pureBlack,
                    label: Text(
                      fdController.itemsInCart.value.toString(),style:
                    const TextStyle(fontWeight: FontWeight.w600,color: mainColor),
                    ),
                    child: Icon(Icons.shopping_cart_outlined,
                      size: heightX*.028,)) :
                const Icon(Icons.shopping_cart_outlined)
                ,
              ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: heightX*.015,),

              // Text: Food Pro
              Text(
                "Food Pro",
                style: TextStyle(fontSize: fontX*.026, fontWeight: FontWeight.bold),
              ),

               SizedBox(height: heightX*.025,),

              // TextField: Search | Icon: Filter List
              FilterWidget(
                  filterOnTap: () {
                    controller.scaffoldKey.currentState?.openEndDrawer();
                  },
                  searchController: controller.searchController,
                  onChange: (value){
                    controller.searchController.text = value;
                    controller.searchResult();
                  },
                suffixIcon: controller.searchController.value.text != ''?
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.searchController.clear();
                  },
                ) : const SizedBox(),
              ),

              SizedBox(height: heightX*.025,),

              // GridView: Food Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(()=>
                controller.filteredList.isEmpty
                    ?  Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(noResultImage,height: heightX*.2,),
                          Text(
                            'No ${controller.searchController.value.text} Item Found :(',
                            style: TextStyle(fontSize: fontX*.022),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    :
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    Center(
                      child: controller.searchController.value.text == ''? Text(
                        "${filterList[controller.currentSelection.value]} Food Items",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ) : Text(
                        "${controller.searchController.value.text.toUpperCase()} Food Items",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ...controller.filteredList.map((foodData) {
                      return InkWell(
                        onTap: (){
                          Get.offNamed(foodDetailScreen,arguments: foodData);
                        },
                        child: FoodCardWidget(foodData: foodData),
                      );
                    }),

                  ],
                ))
              ),

              SizedBox(height: heightX*.030,),
            ],
          ),
        ),
      ),
    );
  }
}

