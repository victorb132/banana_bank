import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:get/get.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Getx Bindings
  Get.lazyPut<AuthService>(() => AuthService());

  // Change color of the status bar system
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
