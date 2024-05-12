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
  });

  final String imagepath;
  final VoidCallback? ontap;
  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final BoxBorder? border;
  final bool applyImageRadius;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.md),
            color: backgroundColor,
            border: border),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(TSizes.md)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imagepath)
                : AssetImage(imagepath) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
