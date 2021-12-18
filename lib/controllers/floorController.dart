import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mall_app/models/category.dart';
import 'package:mall_app/models/floor.dart';

class FloorController extends GetxController {
  var floors = Rx<List<Floor>>(
    [
      Floor(
        id: 1,
        picUrl: 'assets/floor/floorOneBlank.png',
        categoryList: [
          Category(
            id: 1,
            name: 'WC',
            picUrl: 'assets/floor/floorOneWC.png',
            icon: FontAwesomeIcons.toilet,
          ),
          Category(
            id: 2,
            name: 'Men',
            picUrl: 'assets/floor/floorOneMen.png',
            icon: Icons.checkroom,
          ),
          Category(
            id: 3,
            name: 'Women',
            picUrl: 'assets/floor/floorOneWomen.png',
            icon: Icons.checkroom,
          ),
        ],
      ),
      Floor(
        id: 2,
        picUrl: 'assets/floor/floorTwoBlank.png',
        categoryList: [
          Category(
            id: 2,
            name: 'Men',
            picUrl: 'assets/floor/floorTwoMen.png',
            icon: Icons.checkroom,
          ),
          Category(
            id: 3,
            name: 'Women',
            picUrl: 'assets/floor/floorTwoWomen.png',
            icon: Icons.checkroom,
          ),
          Category(
            id: 4,
            name: 'Pray Room',
            picUrl: 'assets/floor/floorTwoPray.png',
            icon: FontAwesomeIcons.mosque,
          ),
        ],
      ),
      Floor(
        id: 3,
        picUrl: 'assets/floor/floorThreeBlank.png',
        categoryList: [
          Category(
            id: 2,
            name: 'Men',
            picUrl: 'assets/floor/floorThreeMen.png',
            icon: Icons.checkroom,
          ),
          Category(
            id: 3,
            name: 'Women',
            picUrl: 'assets/floor/floorThreeWomen.png',
            icon: Icons.checkroom,
          ),
        ],
      ),
    ],
  );

  var selecetdPic = 'assets/floor/floorOneBlank.png'.obs;

  var selctedFloor = Rx<Floor>(Floor());
}
