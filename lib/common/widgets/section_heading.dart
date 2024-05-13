import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.headingText,
    this.buttonText = "View all",
    this.showButton = true,
    this.onpressed,
    this.textColor = TColors.white,
  });
  final String headingText;
  final String buttonText;
  final Color textColor;
  final bool showButton;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingText,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButton)
          TextButton(onPressed: onpressed, child: Text(buttonText))
      ],
    );
  }
}
