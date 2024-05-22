import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/banner_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepo extends GetxController {
  static BannerRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db
          .collection("Banners")
          .where("Active", isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapShot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      Loaders.errorSnackBar(title: "oh Snap!", message: e.toString());
      throw "something went wrong";
    }
  }
}
