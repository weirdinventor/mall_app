import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_app/services/bindings.dart';
import 'package:mall_app/shared/constant.dart';
import 'package:mall_app/views/foodScreen.dart';
import 'package:mall_app/views/homeScreen.dart';
import 'package:mall_app/views/mapScreen.dart';
import 'package:mall_app/views/productScreen.dart';
import 'package:mall_app/views/storeScreen.dart';
import 'package:mall_app/views/zaraScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mall App',
      debugShowCheckedModeBanner: false,
      initialBinding: MallBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: shapeOfButtonRounded,
            //backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
          ),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/map',
          page: () => MapScreen(),
        ),
        GetPage(
          name: '/food',
          page: () => FoodScreen(),
        ),
        GetPage(
          name: '/product',
          page: () => ProductScreen(),
        ),
        GetPage(
          name: '/zara',
          page: () => ZaraScreen(),
        ),
        GetPage(
          name: '/store',
          page: () => StoreScreen(),
        ),
      ],
    );
  }
}
