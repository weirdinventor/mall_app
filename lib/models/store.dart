import 'package:mall_app/models/product.dart';

class Store {
  final int id;
  final String name;
  final String description;
  final List<Product> productList;
  final String floor;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required this.productList,
    required this.floor,
  });
}
