import 'package:ecommerce_app/common/widgets/brand_card.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/pages/brands_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text("Propular Product"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const SectionHeading(
              headingText: "Brands",
              showButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            GridLayout(
                itemcount: 8,
                mainAxisExtent: 80,
                itembuilder: (_, index) {
                  return BrandCard(
                    darkmode: darkmode,
                    onpressed: () {
                      Get.to(() => const BrandsProducts());
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
