import 'package:ecommerce_app/common/widgets/brand_title_text_verified.dart';
import 'package:ecommerce_app/common/widgets/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.darkmode,
    this.showAddandRemoveBtn = true,
  });

  final bool darkmode;
  final bool showAddandRemoveBtn;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (context, index) => const SizedBox(height: TSizes.lg),
      itemBuilder: (context, index) => Column(
        children: [
          CartItem(darkmode: darkmode),
          if (showAddandRemoveBtn) const SizedBox(height: TSizes.spaceBtwItems),
          if (showAddandRemoveBtn)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 70),
                    AddRemoveButtonGroup(darkmode: darkmode),
                  ],
                ),
                const ProductPriceText(price: "256")
              ],
            ),
        ],
      ),
    );
  }
}

class AddRemoveButtonGroup extends StatelessWidget {
  const AddRemoveButtonGroup({
    super.key,
    required this.darkmode,
  });

  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularIcon(
          darkmode: darkmode,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          iconColor: darkmode ? TColors.white : TColors.black,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          "2",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        CircularIcon(
          darkmode: darkmode,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          iconColor: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.darkmode,
  });

  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          imagepath: TImageStrings.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: darkmode ? TColors.dark : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextWithVarifiedIcon(title: "Nike"),
              const Flexible(
                child: ProductTitleText(
                  title: "Black Sports Shoes",
                  maxLines: 1,
                ),
              ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Color ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: "Green ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "Size ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: "UE 05",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ))
            ],
          ),
        )
      ],
    );
  }
}
