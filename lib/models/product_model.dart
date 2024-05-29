import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/brand_model.dart';

class ProductModel {
  int stock;
  double price;
  String title;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String catagoryID;
  List<String>? images;

  ProductModel(
      {required this.title,
      required this.stock,
      required this.price,
      required this.thumbnail,
      required this.catagoryID,
      this.brand,
      this.images,
      this.salePrice = 0.0,
      this.isFeatured,
      this.description});

  static ProductModel empty() => ProductModel(
      title: "", stock: 0, price: 0.0, thumbnail: "", catagoryID: "");

  Map<String, dynamic> toJson() {
    return {
      "Title": title,
      "Stock": stock,
      "Price": price,
      "Thumbnail": thumbnail,
      "CatagoryID": catagoryID,
      "Brand": brand!.toJson(),
      "Images": images ?? [],
      "SalePrice": salePrice,
      "IsFeatured": isFeatured,
      "Description": description
    };
  }

  factory ProductModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      title: data["Title"] ?? "",
      stock: data["Stock"] ?? 0,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? "",
      catagoryID: data["CatagoryID"] ?? "",
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      isFeatured: data["IsFeatured"] ?? false,
      description: data["Description"] ?? "",
    );
  }

  factory ProductModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      title: data["Title"] ?? "",
      stock: data["Stock"] ?? 0,
      price: double.parse((data["Price"] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? "",
      catagoryID: data["CatagoryID"] ?? "",
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
      isFeatured: data["IsFeatured"] ?? false,
      description: data["Description"] ?? "",
    );
  }
}
