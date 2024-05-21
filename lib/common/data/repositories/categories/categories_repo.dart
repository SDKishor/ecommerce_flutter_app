import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepo extends GetxController {
  static CategoryRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
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
