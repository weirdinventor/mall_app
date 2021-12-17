import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 50,
            top: 50,
            bottom: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: Get.size.width / 4,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/map');
                    },
                    child: Text('Map View'),
                  ),
                ),
                Container(
                  height: 100,
                  width: Get.size.width / 4,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Order Food'),
                  ),
                ),
                Container(
                  height: 100,
                  width: Get.size.width / 4,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Goodies'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
