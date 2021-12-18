import 'package:flutter/cupertino.dart';
import 'package:mall_app/models/store.dart';

class Category {
  final int id;
  final String picUrl;
  final String name;
  final List<Store>? storeList;
  final IconData? icon;

  Category({
    this.storeList,
    required this.id,
    required this.picUrl,
    required this.name,
    this.icon,
  });
}
