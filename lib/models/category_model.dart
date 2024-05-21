import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentID;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentID = "",
  });

  static CategoryModel empty() =>
      CategoryModel(id: "", name: "", image: "", isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentID": parentID,
      "IsFeatured": isFeatured
    };
  }

  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return CategoryModel(
        id: document.id,
        name: data!["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? "",
        parentID: data["ParentID"] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
