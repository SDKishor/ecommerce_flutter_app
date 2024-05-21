import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    required this.ontap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback ontap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(TSizes.sm * 1.3),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (darkmode ? TColors.dark : TColors.light),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: isNetworkImage
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.contain,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const ShimmerEffect(
                                    width: 55, hight: 55, radius: 55),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        color: darkmode ? TColors.light : TColors.dark,
                      ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: textColor,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
