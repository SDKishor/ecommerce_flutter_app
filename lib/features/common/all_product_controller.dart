import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/data/repositories/product_repo.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repo = ProductRepo.instance;
  final selectedSortOption = "Name".obs;
  final products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repo.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
      throw "something went wrong";
    }
  }

  sorProduct(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higher Price":
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Sale":
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          }
          return 1;
        });
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sorProduct("Name");
  }
}
