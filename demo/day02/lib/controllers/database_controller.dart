import 'package:day02/models/product_fav.dart';
import 'package:day02/services/database_service.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();
  final products = <ProductFavotite>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    final productList = await _databaseService.getProducts();
    products.value = productList;
  }

  void addProduct(ProductFavotite product) async {
    await _databaseService.insertProduct(product);
    fetchProducts();
  }
}
