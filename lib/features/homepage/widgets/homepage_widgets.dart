import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/category_shimmer_effect.dart';
import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/section_heading.dart';
import 'package:ecommerce_app/common/widgets/shimmer_effect.dart';
import 'package:ecommerce_app/common/widgets/vertical_image_text.dart';
import 'package:ecommerce_app/features/common/banner_controller.dart';
import 'package:ecommerce_app/features/common/categories_controller.dart';
import 'package:ecommerce_app/features/common/user_controller.dart';
import 'package:ecommerce_app/pages/sub_catagory_page.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
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
    final controller = Get.put(UserController());

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
        Obx(() {
          if (controller.profileLoading.value) {
            return const ShimmerEffect(width: 80, hight: 15);
          } else {
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            );
          }
        })
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
    final controller = Get.put(CategoriesController());

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
          Obx(() {
            if (controller.isLoading.value) {
              return const CategoryShimmerEffect();
            }

            if (controller.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  "No Data Found!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white),
                ),
              );
            }

            return SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = controller.featuredCategories[index];
                    return VerticalImageText(
                      isNetworkImage: true,
                      image: category.image,
                      ontap: () {
                        Get.to(() => const SubCategoriesPage());
                      },
                      title: category.name,
                    );
                  }),
            );
          })
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
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const ShimmerEffect(width: 190 * 2, hight: 190);
      }
      if (controller.allBanners.isEmpty) {
        return const Center(child: Text("No data found!"));
      }

      return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.allBanners
                  .map((banner) => RoundedImage(
                        isNetworkImage: true,
                        imagepath: banner.image,
                        ontap: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList()),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.allBanners.length; i++)
                    CircleContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundcolor:
                          controller.carousalCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
