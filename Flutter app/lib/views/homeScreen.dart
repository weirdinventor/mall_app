import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/logo/mallBackground.png',
            fit: BoxFit.cover,
          )),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            left: 0,
            child: Row(
              children: [
                Expanded(
                  child: PageView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/logo/adidas.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/logo/nike.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/logo/lacost.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.size.width / 4,
                  margin: EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavigationButton(
                        text: 'Mall Map',
                        icon: FontAwesomeIcons.map,
                        onTap: () {
                          Get.toNamed('/map');
                        },
                      ),
                      NavigationButton(
                        text: 'Products',
                        icon: Icons.checkroom,
                        onTap: () {
                          Get.toNamed('/product');
                        },
                      ),
                      NavigationButton(
                        text: 'Fast Foods',
                        icon: Icons.fastfood,
                        onTap: () {
                          Get.toNamed('/food');
                        },
                      ),
                      NavigationButton(
                        text: 'Events',
                        icon: FontAwesomeIcons.calendarWeek,
                        onTap: () {},
                      ),
                    ],
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

class NavigationButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData icon;

  const NavigationButton(
      {Key? key, required this.text, this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
            Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
