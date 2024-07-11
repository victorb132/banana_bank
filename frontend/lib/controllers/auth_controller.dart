import 'package:flutter/material.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cep = TextEditingController();
  final formKey = GlobalKey<FormState>();

  resetState() {
    name.clear();
    email.clear();
    password.clear();
    cep.clear();
  }

  register() async {
    await AuthService.to
        .createUser(name.text, password.text, email.text, cep.text);
    resetState();
  }
}
