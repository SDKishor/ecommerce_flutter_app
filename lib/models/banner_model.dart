import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String image;
  String targetScreen;
  bool active;

  BannerModel({
    required this.image,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {"Image": image, "TargetScreen": targetScreen, "Active": active};
  }

  factory BannerModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return BannerModel(
      image: data!["Image"] ?? "",
      targetScreen: data["TargetScreen"] ?? "",
      active: data["Active"] ?? false,
    );
  }
}
