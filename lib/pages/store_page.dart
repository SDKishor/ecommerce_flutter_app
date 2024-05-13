import 'package:ecommerce_app/common/widgets/brand_card.dart';
import 'package:ecommerce_app/common/widgets/cart_counter_icon.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/common/widgets/custom_tab_bar.dart';
import 'package:ecommerce_app/common/widgets/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/features/storepage/widgets/storepage_widgets.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppbar(
          title: const Text("Store"),
          actions: [
            CartCounterIcon(
              onpressed: () {},
              darkmode: darkmode,
              iconColor: darkmode ? TColors.light : TColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxisScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: darkmode ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const CustomSearchBar(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      SectionHeading(
                        headingText: "Featured Brands",
                        onpressed: () {},
                        textColor: darkmode ? TColors.light : TColors.dark,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      GridLayout(
                          itemcount: 4,
                          mainAxisExtent: 80,
                          itembuilder: (_, index) {
                            return BrandCard(darkmode: darkmode);
                          })
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  darkmode: darkmode,
                  tabs: const [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furnitures")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("clothes")),
                    Tab(child: Text("cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CatagoryTab(darkmode: darkmode),
              CatagoryTab(darkmode: darkmode),
              CatagoryTab(darkmode: darkmode),
              CatagoryTab(darkmode: darkmode),
              CatagoryTab(darkmode: darkmode),
            ],
          ),
        ),
      ),
    );
  }
}
