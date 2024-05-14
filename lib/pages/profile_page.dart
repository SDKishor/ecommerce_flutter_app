import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/common/widgets/setting_menu_tile.dart';
import 'package:ecommerce_app/features/profilepage/widgets/profilepage_widgets.dart';
import 'package:ecommerce_app/pages/user_addresses_page.dart';
import 'package:ecommerce_app/pages/user_order_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            PrimaryHeaderContainer(
                child: Column(
              children: [
                CustomAppbar(
                  title: Text("Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white)),
                ),
                const UserProfileTile(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),
            //body

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(
                    headingText: "Account Settings",
                    showButton: false,
                    textColor: darkmode ? TColors.light : TColors.dark,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set shopping delivery address",
                    ontap: () {
                      Get.to(() => const UserAddressPage());
                    },
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subtitle: "Add, remove product and move to checkout"),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-progress and completed Orders",
                    ontap: () {
                      Get.to(() => const UserOrderPage());
                    },
                  ),
                  const SettingMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Accounts",
                      subtitle: "Manage your bank account"),
                  const SettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subtitle: "List of discounted coupons"),
                  const SettingMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subtitle: "Set any kinds of notification massage"),
                  const SettingMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subtitle: "Manage your data and connected accounts"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SectionHeading(
                    headingText: "Account Settings",
                    showButton: false,
                    textColor: darkmode ? TColors.light : TColors.dark,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload data to the cloud",
                  ),
                  SettingMenuTile(
                      icon: Iconsax.location,
                      title: "GeoLocation",
                      subtitle: "Set recommendation based on location",
                      trailling: Switch(value: true, onChanged: (value) {})),
                  SettingMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subtitle: "Search result is safe for all ages",
                      trailling: Switch(value: true, onChanged: (value) {})),
                  SettingMenuTile(
                      icon: Iconsax.image,
                      title: "HD Image Quality",
                      subtitle: "set image quality to be seen",
                      trailling: Switch(value: false, onChanged: (value) {})),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
