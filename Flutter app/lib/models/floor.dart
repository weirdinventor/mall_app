import 'package:flutter/cupertino.dart';
import 'package:mall_app/models/category.dart';
import 'package:mall_app/models/store.dart';

class Floor {
  final int? id;
  final List<Category>? categoryList;
  final String? picUrl;
  

  Floor({
    this.id,
    this.categoryList,
    this.picUrl,
  });
}
