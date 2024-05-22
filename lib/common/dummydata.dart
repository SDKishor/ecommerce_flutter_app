import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/banner_model.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/routes/routes.dart';

class DummyData {
  List<CategoryModel> catagoryList = [
    CategoryModel(
      id: "",
      name: "Sports",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-bowling-64.png?alt=media&token=baef79cc-428c-4914-804e-b32fcad27820",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Furniture",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-dining-chair-64.png?alt=media&token=c791a1b8-ffdd-449a-91c8-8bfe9225321e",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Electronics",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-smartphone-64.png?alt=media&token=e745fa6e-2421-4833-9c49-7568278081c3",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Clothes",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-school-uniform-64.png?alt=media&token=43dbca61-d3c3-46f1-ae84-7552ad8db7c6",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Animals",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-dog-heart-64.png?alt=media&token=12f85e90-d3ca-401e-b503-dae321ac93a3",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Shoes",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-shoes-64.png?alt=media&token=c15664ad-6059-4dfe-bd07-e51cc38c2208",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Cosmatics",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-cosmetics-64.png?alt=media&token=7a9d6be4-415e-4e44-8a91-0ea1b724aa02",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Jewelery",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-sparkling-diamond-64.png?alt=media&token=40f5852a-7861-4186-9730-da7a015bf5c3",
      isFeatured: true,
    ),
  ];

  List<BannerModel> bannerList = [
    BannerModel(
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Banners%2Fbanner_1.jpg?alt=media&token=55418f54-cc25-46a7-8231-a89016634524",
        targetScreen: Routes.storePage,
        active: true),
    BannerModel(
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Banners%2Fbanner_2.jpg?alt=media&token=69958f66-618c-4906-8415-3b25ca030640",
        targetScreen: Routes.storePage,
        active: true),
    BannerModel(
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Banners%2Fbanner_3.jpg?alt=media&token=65690454-54bf-464d-9d55-5f165abfd961",
        targetScreen: Routes.wishlist,
        active: true),
  ];

  saveListData() {
    for (var element in bannerList) {
      saveBannerDummyData(element);
    }
  }

  saveCategoryDummyData(CategoryModel data) async {
    final CategoryModel category = CategoryModel(
        id: "",
        name: data.name,
        image: data.image,
        isFeatured: data.isFeatured);

    await FirebaseFirestore.instance
        .collection("Categories")
        .doc()
        .set(category.toJson());
  }

  saveBannerDummyData(BannerModel data) async {
    final BannerModel banner = BannerModel(
        image: data.image,
        targetScreen: data.targetScreen,
        active: data.active);

    await FirebaseFirestore.instance
        .collection("Banners")
        .doc()
        .set(banner.toJson());
  }
}
