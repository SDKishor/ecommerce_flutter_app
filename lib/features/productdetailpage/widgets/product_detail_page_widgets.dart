import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/brand_title_text_verified.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/curved_edges.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_choice_chip.dart';
import 'package:ecommerce_app/common/widgets/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/features/common/image_controller.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.darkmode,
    required this.product,
  });
  final ProductModel product;
  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllPoductImage(product);
    return CurvedEdgeWidget(
      child: Container(
        color: darkmode ? TColors.darkGrey : TColors.grey,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnleargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: TColors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            //image slider

            Positioned(
              bottom: 30,
              left: 12,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectedProductImage.value ==
                                  images[index];
                          return RoundedImage(
                            ontap: () {
                              controller.selectedProductImage.value =
                                  images[index];
                            },
                            isNetworkImage: true,
                            border: Border.all(
                                color: imageSelected
                                    ? TColors.primary
                                    : Colors.transparent),
                            width: 80,
                            imagepath: images[index],
                            backgroundColor:
                                darkmode ? TColors.dark : TColors.light,
                            padding: const EdgeInsets.all(TSizes.sm),
                          );
                        }),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                    itemCount: images.length),
              ),
            ),

            //Appbar Icons
            CustomAppbar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  darkmode: darkmode,
                  icon: Iconsax.heart5,
                  iconColor: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RatingAndShere extends StatelessWidget {
  const RatingAndShere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "5.0", style: Theme.of(context).textTheme.labelLarge),
              const TextSpan(text: "(199)")
            ]))
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: TSizes.iconMd,
          ),
        )
      ],
    );
  }
}

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.darkmode,
  });
  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleContainer(
              radius: TSizes.sm,
              backgroundcolor: TColors.secondary.withOpacity(.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            //price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const ProductPriceText(
              price: "175",
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //title
        const ProductTitleText(
          title: "Green Nike Sports Shirt",
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        //status
        Row(
          children: [
            const ProductTitleText(
              title: "Status",
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            RoundedImage(
              imagepath: TImageStrings.clothIcon,
              width: 32,
              height: 32,
              backgroundColor: Colors.transparent,
              imageColor: darkmode ? TColors.light : TColors.dark,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 1.5),
            const BrandTitleTextWithVarifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

class ProductAattribute extends StatelessWidget {
  const ProductAattribute({
    super.key,
    required this.darkmode,
  });
  final bool darkmode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
      child: Column(
        children: [
          CircleContainer(
            radius: 16,
            padding: const EdgeInsets.all(TSizes.md),
            backgroundcolor: darkmode ? TColors.darkerGrey : TColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    const SectionHeading(
                      headingText: "Variation",
                      showButton: false,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const ProductTitleText(
                              title: "Price",
                              smallSize: true,
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            Text(
                              "\$25",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            Text("\$20",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          children: [
                            const ProductTitleText(
                              title: "Stock",
                              smallSize: true,
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            Text("In Stock",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                const ProductTitleText(
                  title:
                      "this is the Description of the product and it can ge upto max 4 line",
                  smallSize: true,
                  maxLines: 4,
                )
              ],
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(headingText: "Colors"),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: [
                  CustomChoiceChip(
                    text: "Green",
                    selected: true,
                    onselected: (value) {},
                  ),
                  CustomChoiceChip(
                    text: "Blue",
                    selected: false,
                    onselected: (value) {},
                  ),
                  CustomChoiceChip(
                    text: "Red",
                    selected: false,
                    onselected: (value) {},
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(headingText: "Sizes"),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: [
                  CustomChoiceChip(
                    text: "EU 34",
                    selected: true,
                    onselected: (value) {},
                  ),
                  CustomChoiceChip(
                    text: "EU 35",
                    selected: false,
                    onselected: (value) {},
                  ),
                  CustomChoiceChip(
                    text: "EU 36",
                    selected: false,
                    onselected: (value) {},
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
