import 'package:get/get.dart';
import 'package:mall_app/models/store.dart';

class StoreController extends GetxController {
  var stores = Rx<List<Store>>([
    Store(
      id: 1,
      description:
          'Zara SA, stylized as ZARA, is a Spanish apparel retailer based in Arteixo, A Coruña, Galicia, Spain. The company specializes in fast fashion, and products include clothing, accessories, shoes, swimwear, beauty, and perfumes. It is the largest company in the Inditex group, the world\'s largest apparel retailer.',
      floor: 'Floor 1',
      name: 'ZARA',
      productList: [], picUrl: '',
    ),
    Store(
      id: 2,
      description:
          'Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area.',
      floor: 'Floor 2',
      name: 'Nike',
      productList: [], picUrl: '',
    ),
    Store(
      id: 3,
      description:
          'Adidas AG is a German multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories. It is the largest sportswear manufacturer in Europe, and the second largest in the world, after Nike',
      floor: 'Floor 3',
      name: 'Adidas',
      productList: [], picUrl: '',
    ),
  ]);
}
