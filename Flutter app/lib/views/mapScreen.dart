import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mall_app/controllers/floorController.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  final isFloor = false.obs;

  final FloorController _floorController = Get.find();

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
                // map area
                Expanded(
                  child: Obx(
                    () => Container(
                      padding: EdgeInsets.all(50),
                      margin: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image:
                                AssetImage(_floorController.selecetdPic.value)),
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // back button
                          Obx(
                            () => (!isFloor.value)
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      isFloor.value = false;
                                      _floorController.selecetdPic.value =
                                          'assets/floor/floorOneBlank.png';
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                  ),
                          ),
                          // search icon
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Obx(() => (isFloor.value)
                          ? Expanded(
                              child: Obx(
                                () => ListView.separated(
                                  separatorBuilder: (context, i) => SizedBox(
                                    height: 30,
                                  ),
                                  itemCount: _floorController
                                      .selctedFloor.value.categoryList!.length,
                                  itemBuilder: (context, i) {
                                    return ServiceItem(
                                      text: _floorController.selctedFloor.value
                                          .categoryList![i].name,
                                      icon: _floorController.selctedFloor.value
                                          .categoryList![i].icon!,
                                      onTap: () {
                                        _floorController.selecetdPic.value =
                                            _floorController.selctedFloor.value
                                                .categoryList![i].picUrl;
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              child: Column(
                                children: [
                                  // list of floors
                                  FloorItem(
                                    text: 'Floor 1',
                                    onTap: () {
                                      isFloor.value = true;
                                      _floorController.selctedFloor.value =
                                          _floorController.floors.value[0];
                                      _floorController.selctedFloor.refresh();
                                      _floorController.selecetdPic.value =
                                          _floorController
                                              .selctedFloor.value.picUrl!;
                                    },
                                  ),
                                  FloorItem(
                                    text: 'Floor 2',
                                    onTap: () {
                                      isFloor.value = true;
                                      _floorController.selctedFloor.value =
                                          _floorController.floors.value[1];
                                      _floorController.selctedFloor.refresh();
                                      _floorController.selecetdPic.value =
                                          _floorController
                                              .selctedFloor.value.picUrl!;
                                    },
                                  ),
                                  FloorItem(
                                    text: 'Floor 3',
                                    onTap: () {
                                      isFloor.value = true;
                                      _floorController.selctedFloor.value =
                                          _floorController.floors.value[2];
                                      _floorController.selctedFloor.refresh();
                                      _floorController.selecetdPic.value =
                                          _floorController
                                              .selctedFloor.value.picUrl!;
                                    },
                                  ),
                                ],
                              ),
                            )),
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

class FloorItem extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const FloorItem({Key? key, required this.text, this.onTap}) : super(key: key);

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
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Icon(
              Icons.layers,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  ServiceItem({Key? key, required this.text, this.onTap, required this.icon})
      : super(key: key);

  final String text;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
