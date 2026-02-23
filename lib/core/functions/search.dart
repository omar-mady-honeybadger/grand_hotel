import 'package:grand_hotel/core/data/product_model.dart';

List<ProductModel> getProductByName(String productName) {
  return allProducts
      .where((item) => item.name?.toLowerCase().contains(productName) == true)
      .toList();
}