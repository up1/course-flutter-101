import 'package:day02/models/product_response.dart';
import 'package:day02/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  final productResponse = ProductResponse().obs;

  void getAllProducts() async {
    try {
      final response = await _productService.fetchAllProduct(50);
      productResponse.value = response;
    } catch (e) {
      // TODO :: Handle the error
      print('Failed to get all products: $e');
    }
  }
}
