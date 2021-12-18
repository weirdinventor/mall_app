import 'package:get/get.dart';
import 'package:mall_app/controllers/floorController.dart';

class MallBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FloorController>(FloorController());
  }
}
