import 'package:mall_app/models/store.dart';

class Floor {
  final int id;
  final List<Store> storeList;

  Floor({
    required this.id,
    required this.storeList,
  });
}
