import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer_Effect/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/common/all_product_controller.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());

    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: FutureBuilder(
                  future:
                      futureMethod ?? controller.fetchProductsByQuery(query),
                  builder: (context, snapshot) {
                    Widget loader = GridLayout(
                      mainAxisExtent: 320,
                      itemcount: 4,
                      itembuilder: (p0, p1) => const VerticalShimmerEffect(),
                    );
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return SortableProducts(
                      products: products,
                    );
                  }))),
    );
  }
}

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductController.instance;
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) {
            controller.sorProduct(value!);
          },
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => GridLayout(
              itemcount: controller.products.length,
              itembuilder: (
                _,
                index,
              ) =>
                  ProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }
}
