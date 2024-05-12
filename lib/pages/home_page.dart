import 'package:ecommerce_app/common/widgets/cart_counter_icon.dart';

import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/common/widgets/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product_card_vertical.dart';

import 'package:ecommerce_app/features/homepage/widgets/homepage_widgets.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomepagHeader(
              child: Column(
                children: [
                  //appbar
                  CustomAppbar(
                    title: const HomeAppbarTitle(),
                    actions: [
                      CartCounterIcon(
                        onpressed: () {},
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
            GridLayout(
              itemcount: 4,
              itembuilder: (_, index) => const ProductCardVertical(),
            ),
          ],
        ),
      ),
    );
  }
}
