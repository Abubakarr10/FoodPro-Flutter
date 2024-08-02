import 'package:flutter/material.dart';
import 'package:food_pro/constant/bindings/all_bindings.dart';
import 'package:food_pro/constant/routes/screen_names.dart';
import 'package:food_pro/model/food_model.dart';
import 'package:food_pro/screens/home/home_screen.dart';
import 'package:food_pro/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'constant/routes/routing.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.initFlutter();
  Hive.registerAdapter(FoodModelAdapter());
  await Hive.openBox<FoodModel>('Food');
  await Hive.openBox<FoodModel>('Favourite');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Pro',
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: splashScreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Averta'
      ),
      home: const SplashScreen(),
    );
  }
}

