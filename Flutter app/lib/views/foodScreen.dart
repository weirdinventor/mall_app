import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/logo/mallBackground.png',
            fit: BoxFit.cover,
          )),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(50),
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            FoodItem(
                              name: 'Pizza',
                              picUrl: 'assets/logo/pizza.jpg',
                              price: '450 DZD',
                              restoName: 'Pizza Huts',
                            ),
                            FoodItem(
                              name: 'Taco XL',
                              picUrl: 'assets/logo/taco.jpeg',
                              price: '450 DZD',
                              restoName: 'Wood picker',
                            ),
                            FoodItem(
                              name: 'Hamburger XL',
                              picUrl: 'assets/logo/hamburger.jpg',
                              price: '250 DZD',
                              restoName: 'Mc Donalds',
                            ),
                            FoodItem(
                              name: 'Chawarma',
                              picUrl: 'assets/logo/chawarma.jpg',
                              price: '350 DZD',
                              restoName: 'Casbah',
                            ),
                            FoodItem(
                              name: 'Sardin',
                              picUrl: 'assets/logo/sardin.jpg',
                              price: '600 DZD',
                              restoName: 'The Chef',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FoodItem(
                              name: 'Taco',
                              picUrl: 'assets/logo/taco.jpeg',
                              price: '550 DZD',
                              restoName: 'Pizza Huts',
                            ),
                            FoodItem(
                              name: 'Taco XL',
                              picUrl: 'assets/logo/taco.jpeg',
                              price: '450 DZD',
                              restoName: 'Wood picker',
                            ),
                            FoodItem(
                              name: 'Hamburger XL',
                              picUrl: 'assets/logo/hamburger.jpg',
                              price: '250 DZD',
                              restoName: 'Mc Donalds',
                            ),
                            FoodItem(
                              name: 'Chawarma',
                              picUrl: 'assets/logo/chawarma.jpg',
                              price: '350 DZD',
                              restoName: 'Casbah',
                            ),
                            FoodItem(
                              name: 'Panini',
                              picUrl: 'assets/logo/panini.jpg',
                              price: '150 DZD',
                              restoName: 'burgers',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.size.width / 4,
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      // items
                      CartItem(
                        name: 'Pizza',
                        price: '450 DZD',
                        picUrl: 'assets/logo/pizza.jpg',
                      ),
                      SizedBox(height: 20),
                      CartItem(
                        name: 'Tacos',
                        price: '550 DZD',
                        picUrl: 'assets/logo/taco.jpeg',
                      ),
                      // order button
                      Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total : 1500 DZD',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Order',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
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

class FoodItem extends StatelessWidget {
  const FoodItem({
    Key? key,
    required this.name,
    required this.price,
    required this.picUrl,
    required this.restoName,
  }) : super(key: key);

  final String name;
  final String price;
  final String picUrl;
  final String restoName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 150,
            child: Image.asset(
              picUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Text(
            price,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          Text(
            restoName,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Add to Cart',
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key, required this.name, required this.price, required this.picUrl})
      : super(key: key);

  final String name;
  final String price;
  final String picUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            // pic
            Container(
              height: 50,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  picUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '2',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
