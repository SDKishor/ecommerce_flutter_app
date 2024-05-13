import 'package:ecommerce_app/common/widgets/circle_container.dart';
import 'package:ecommerce_app/common/widgets/curved_edges.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: CircleContainer(
                  backgroundcolor: TColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: CircleContainer(
                  backgroundcolor: TColors.textWhite.withOpacity(0.1),
                )),
            child
          ],
        ),
      ),
    );
  }
}
