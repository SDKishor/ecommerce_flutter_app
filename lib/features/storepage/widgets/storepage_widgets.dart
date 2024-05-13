import 'package:ecommerce_app/common/widgets/brand_show_case_card.dart';
import 'package:ecommerce_app/common/widgets/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CatagoryTab extends StatelessWidget {
  const CatagoryTab({
    super.key,
    required this.darkmode,
  });

  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                BrandShowCase(
                  darkmode: darkmode,
                  images: const [
                    TImageStrings.productImage3,
                    TImageStrings.productImage4,
                    TImageStrings.productImage5,
                  ],
                ),
                SectionHeading(
                  textColor: darkmode ? TColors.light : TColors.dark,
                  headingText: "You Might Like",
                  onpressed: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                GridLayout(
                  itemcount: 4,
                  itembuilder: (_, index) => const ProductCardVertical(),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            ),
          ),
        ]);
  }
}
