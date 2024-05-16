import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/common/widgets/vertical_image_text.dart';
import 'package:ecommerce_app/features/homepage/controllers/homepage_controller.dart';
import 'package:ecommerce_app/pages/sub_catagory_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbarTitle extends StatelessWidget {
  const HomeAppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.homeAppbarTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: TColors.grey),
        ),
        Text(
          TTexts.homeAppbarSubTitle,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        )
      ],
    );
  }
}

class HomeCatagorySection extends StatelessWidget {
  const HomeCatagorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          //heading
          const SectionHeading(
            headingText: "Popular Categories",
            showButton: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //categories
          SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return VerticalImageText(
                    image: TImageStrings.shoeIcon,
                    ontap: () {
                      Get.to(() => const SubCategoriesPage());
                    },
                    title: "shoes",
                  );
                }),
          )
        ],
      ),
    );
  }
}

class HomePromoSlider extends StatelessWidget {
  const HomePromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: const [
            RoundedImage(
              imagepath: TImageStrings.promoBanner1,
            ),
            RoundedImage(
              imagepath: TImageStrings.promoBanner1,
            ),
            RoundedImage(
              imagepath: TImageStrings.promoBanner1,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  CircleContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundcolor: controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
