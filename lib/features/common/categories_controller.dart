import 'package:ecommerce_app/common/data/repositories/categories/categories_repo.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final categoryRepo = Get.put(CategoryRepo());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await categoryRepo.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentID.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
      throw "something went wrong";
    } finally {
      isLoading.value = false;
    }
  }
}
