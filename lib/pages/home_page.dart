import 'package:ecommerce_app/common/dummydata.dart';
import 'package:ecommerce_app/common/widgets/cart_counter_icon.dart';

import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/common/widgets/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';

import 'package:ecommerce_app/features/homepage/widgets/homepage_widgets.dart';
import 'package:ecommerce_app/pages/all_product_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  CustomAppbar(
                    title: const HomeAppbarTitle(),
                    actions: [
                      CartCounterIcon(
                        darkmode: darkmode,
                        onpressed: () async {
                          // Get.to(() => const CartPage());
                          DummyData().saveListData();
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //searchbar
                  const CustomSearchBar(
                    text: "Search in Store",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //catagory section
                  const HomeCatagorySection(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: HomePromoSlider(),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: SectionHeading(
                headingText: "Popular Products",
                onpressed: () {
                  Get.to(() => const AllProducts());
                },
                textColor: !darkmode ? TColors.dark : TColors.light,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace / 2),
              child: GridLayout(
                itemcount: 4,
                itembuilder: (_, index) => const ProductCardVertical(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
