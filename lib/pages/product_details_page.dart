import 'package:ecommerce_app/common/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/features/productdetailpage/widgets/product_detail_page_widgets.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/pages/procuct_review_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: BottomAddToCart(darkmode: darkmode),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image slider
            ProductImageSlider(
              darkmode: darkmode,
              product: product,
            ),

            //product details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //rating and share
                  const RatingAndShere(),

                  //price, title, stock, brand
                  ProductMetaData(
                    darkmode: darkmode,
                    product: product,
                  ),

                  //Attributes
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Checkout"),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Description
                  SectionHeading(
                      showButton: false,
                      headingText: "Description",
                      textColor: darkmode ? TColors.light : TColors.dark),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? "",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show More",
                    trimExpandedText: "Less",
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                          headingText: "Reviews(119)",
                          showButton: false,
                          textColor: darkmode ? TColors.light : TColors.dark),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviewPage());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
