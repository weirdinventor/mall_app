import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_app/models/product.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

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
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: Get.size.width / 4,
                    child: Image.asset(
                      'assets/logo/nikeLogo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 30),
                  // name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Nike',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 600,
                          child: Text(
                            'Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ProductCard(
                                picUrl: 'assets/logo/shoe.jpg',
                                name: 'Air Force',
                                price: '8900 DZD',
                              ),
                              ProductCard(
                                picUrl: 'assets/logo/cap.jpg',
                                name: 'Sports Cap',
                                price: '1000 DZD',
                              ),
                              ProductCard(
                                picUrl: 'assets/logo/tshirt.jpg',
                                name: 'Gym T shirt',
                                price: '3200 DZD',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key, required this.picUrl, required this.name, required this.price})
      : super(key: key);

  final String picUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              picUrl,
              fit: BoxFit.cover,
            ),
            height: 300,
            width: 300,
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
          SizedBox(height: 20),
          Text(
            price,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
