import 'package:ecommerce_app/pages/home_page.dart';
import 'package:ecommerce_app/pages/profile_page.dart';
import 'package:ecommerce_app/pages/store_page.dart';
import 'package:ecommerce_app/pages/wishlist_page.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.homepage, page: () => const HomePage()),
    GetPage(name: Routes.profile, page: () => const ProfilePage()),
    GetPage(name: Routes.wishlist, page: () => const WishListPage()),
    GetPage(name: Routes.storePage, page: () => const StorePage()),
  ];
}
