import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // add widgets binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //add to local storage
  await GetStorage.init();

  //await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => (Get.put(AuthenticationRepo())));

  runApp(const App());
}
