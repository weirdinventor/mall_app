import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall_app/views/storeScreen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  var isSearch = false.obs;
  var _currentSliderValue = 100.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        actions: [
          IconButton(
            onPressed: () {
              isSearch.value = !isSearch.value;
            },
            icon: Obx(() => Icon(isSearch.value ? Icons.cancel : Icons.search)),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/logo/mallBackground.png',
            fit: BoxFit.cover,
          )),
          Obx(
            () => Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: (isSearch.value)
                  ? Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.all(20),
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        color: Colors.blue,
                                        child: Row(
                                          children: [
                                            Text(
                                              'Filter by categorie',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Price : ',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Obx(
                                      () => Container(
                                        width: 500,
                                        child: Slider(
                                          value: _currentSliderValue.value,
                                          max: 10000,
                                          divisions: 100,
                                          label: _currentSliderValue
                                              .round()
                                              .toString(),
                                          onChanged: (double value) {
                                            _currentSliderValue.value = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '10000',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: PageView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: StoreItem(
                                        text: 'Nike',
                                        floor: 'Floor 1',
                                        picUrl: 'assets/logo/nikeLogo.jpg',
                                        onTap: () {
                                          Get.toNamed('/store');
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: StoreItem(
                                        text: 'Adidas',
                                        floor: 'Floor 2',
                                        picUrl: 'assets/logo/adidasLogo.jpg',
                                      ),
                                    ),
                                    Expanded(
                                      child: StoreItem(
                                        text: 'ZARA',
                                        floor: 'Floor 1',
                                        picUrl: 'assets/logo/zara.jpg',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    StoreItem(
                                      text: 'Nike',
                                      floor: 'Floor 1',
                                      picUrl: 'assets/logo/zara.jpg',
                                    ),
                                    StoreItem(
                                      text: 'Nike',
                                      floor: 'Floor 1',
                                      picUrl: 'assets/logo/zara.jpg',
                                    ),
                                    StoreItem(
                                      text: 'Nike',
                                      floor: 'Floor 1',
                                      picUrl: 'assets/logo/zara.jpg',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  const StoreItem({
    Key? key,
    required this.text,
    required this.floor,
    required this.picUrl,
    this.onTap,
  }) : super(key: key);

  final String text;
  final String floor;
  final String picUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // image
          Container(
            child: Image.asset(
              picUrl,
              fit: BoxFit.cover,
            ),
            height: 500,
            width: Get.size.width / 3,
          ),
          SizedBox(height: 40),
          // name
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30),
          // floor
          Text(
            floor,
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final double? itemWidth;

  const GridItem(
      {Key? key, required this.text, required this.icon, this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: itemWidth == null ? null : itemWidth,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(text),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
