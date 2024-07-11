import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  static AuthService get to => Get.find<AuthService>();

  createUser(String name, String password, String email, String cep) async {
    try {
      var http = Dio();

      await http.post(
        'http://localhost:4000/api/users',
        data: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'cep': cep,
        }),
      );
      Get.snackbar(
        'Sucesso',
        'Usuário criado com sucesso!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        'Erro ao registrar!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }
}
