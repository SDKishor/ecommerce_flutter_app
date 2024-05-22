import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.imagepath,
    this.ontap,
    this.height,
    this.width,
    this.padding,
    this.backgroundColor = TColors.light,
    this.border,
    this.applyImageRadius = true,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.imageColor,
    this.radius = TSizes.md,
  });

  final String imagepath;
  final VoidCallback? ontap;
  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor, imageColor;
  final BoxBorder? border;
  final bool applyImageRadius;
  final BoxFit? fit;
  final bool isNetworkImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor,
            border: border),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(radius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imagepath,
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const ShimmerEffect(width: 55, hight: 55, radius: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(imagepath),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
