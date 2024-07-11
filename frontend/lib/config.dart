import 'package:flutter/material.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:get/get.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Getx Bindings
  Get.lazyPut<AuthService>(() => AuthService());
}
