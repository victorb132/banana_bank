import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:get/get.dart';

void main() async {
  await initConfigurations();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Banana Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SignUpScreen(),
    );
  }
}
