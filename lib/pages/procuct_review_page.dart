import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductReviewPage extends StatelessWidget {
  const ProductReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text("Reviews & Ratings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Reating and reviews are varified nad are from people who use the same type of devide"),
              const SizedBox(height: TSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "4.5",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        RatingProgressIndicator(text: "5", value: 1.0),
                        RatingProgressIndicator(text: "4", value: 0.8),
                        RatingProgressIndicator(text: "3", value: 0.6),
                        RatingProgressIndicator(text: "2", value: 0.3),
                        RatingProgressIndicator(text: "1", value: 0.1),
                      ],
                    ),
                  )
                ],
              ),
              RatingBarIndicator(
                itemBuilder: (context, index) => const Icon(
                  Iconsax.star1,
                  color: TColors.primary,
                ),
                rating: 4.5,
                itemSize: 20,
                unratedColor: TColors.grey,
              ),
              Text(
                "12,123",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // user reviews
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const RoundedImage(
                    imagepath: TImageStrings.userProfileImage1,
                    height: 50,
                    width: 50,
                    radius: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              RatingBarIndicator(
                itemBuilder: (context, index) => const Icon(
                  Iconsax.star1,
                  color: TColors.primary,
                ),
                rating: 4.5,
                itemSize: 20,
                unratedColor: TColors.grey,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                "01 Nov, 2023",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          const ReadMoreText(
            "The user interface of the app is quite intuitive. I was able to navigate and make purchase easyly. Good job. ",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show More",
            trimExpandedText: "Less",
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: TColors.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: TColors.primary),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          CircleContainer(
            radius: 20,
            backgroundcolor: darkmode ? TColors.darkerGrey : TColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "John Doe",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "01 Nov, 2023",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    "The user interface of the app is quite intuitive. I was able to navigate and make purchase easyly. Good job. ",
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show More",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 9,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: TColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor: const AlwaysStoppedAnimation(TColors.primary),
          ),
        ),
      ],
    );
  }
}
