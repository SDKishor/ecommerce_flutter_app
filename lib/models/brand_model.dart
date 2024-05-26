import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String name;
  String image;
  int? productCount;
  bool? isFeatured;

  BrandModel({
    required this.name,
    required this.image,
    this.isFeatured = true,
    this.productCount = 0,
  });

  static BrandModel empty() => BrandModel(
        name: "",
        image: "",
      );

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ProductCount": productCount,
      "IsFeatured": isFeatured
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return BrandModel(
      name: data["Name"] ?? "",
      image: data["Image"] ?? "",
      isFeatured: data["IsFeatured"] ?? false,
      productCount: data["ProductCount"] ?? 0,
    );
  }

  factory BrandModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return BrandModel(
        name: data!["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        productCount: data["ProductCount"] ?? 0,
      );
    } else {
      return BrandModel.empty();
    }
  }
}
