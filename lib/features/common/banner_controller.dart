import 'package:ecommerce_app/common/data/repositories/banner_repo.dart';
import 'package:ecommerce_app/models/banner_model.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepo());
      final banners = await bannerRepo.getAllBanners();

      allBanners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
      throw "something went wrong";
    } finally {
      isLoading.value = false;
    }
  }
}
