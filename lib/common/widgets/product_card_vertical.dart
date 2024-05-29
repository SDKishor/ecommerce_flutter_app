import 'package:ecommerce_app/common/style/shadow_style.dart';
import 'package:ecommerce_app/common/widgets/brand_title_text_verified.dart';
import 'package:ecommerce_app/common/widgets/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/features/common/product_controller.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/product_details_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(product: product));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkmode ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            CircleContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundcolor: Colors.transparent,
              child: Stack(
                children: [
                  RoundedImage(
                    height: 180,
                    isNetworkImage: true,
                    imagepath: product.thumbnail,
                    backgroundColor: darkmode ? TColors.dark : TColors.light,
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: CircleContainer(
                      radius: TSizes.sm,
                      backgroundcolor: TColors.secondary.withOpacity(.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        "${controller.calcSalePercentage(product.price, product.salePrice)}%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      darkmode: darkmode,
                      icon: Iconsax.heart5,
                      iconColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.title,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  BrandTitleTextWithVarifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductPriceText(
                    price: product.salePrice.toString(),
                    isLarge: true,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.cardRadiusMd),
                      ),
                    ),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: TColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
