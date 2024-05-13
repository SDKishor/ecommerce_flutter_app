import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/features/productdetailpage/widgets/product_detail_page_widgets.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image slider
            ProductImageSlider(darkmode: darkmode),

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
                  ProductMetaData(darkmode: darkmode),
                  //Attributes
                  //Checkout button
                  //Description
                  //Review
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
