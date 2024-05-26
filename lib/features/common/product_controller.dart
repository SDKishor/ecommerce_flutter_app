import 'package:ecommerce_app/common/data/repositories/product_repo.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProduct = <ProductModel>[].obs;
  final productRepo = Get.put(ProductRepo());

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProduct();
  }

  fetchFeaturedProduct() async {
    try {
      isLoading.value = true;

      final products = await productRepo.getFeaturedProduct();

      featuredProduct.assignAll(products);
    } catch (e) {
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String? calcSalePercentage(double orginalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }

    double percentage = ((orginalPrice - salePrice) / orginalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }
}
