import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spenmax/model/api/config.dart';
import 'package:http/http.dart' as http;
import 'package:spenmax/model/components/snackbar.dart';
import 'package:spenmax/views/home_screen.dart';

class Api {
  final box = GetStorage();

//get session id
  Future<String?> getSessionId() async {
    return box.read('token');
  }

  Future<void> deleteSessionId() async {
    await box.remove('token');
    print('Session ID deleted');
  }

  // Future<void> deleteRefreshToken() async {
  //   await box.remove('Refreshtoken');

  //   print('Refresh ID deleted');
  // }

  // Future<String?> getRefreshToken() async {
  //   return box.read('Refreshtoken');
  // }

  Future<void> authenticate(String email, String password) async {
    final url = Uri.parse('${AppConfig.baseUrl}/user/login/');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': email,
          'password': password,
        }),
      );
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['type'] == 'user') {
          final String token = responseData["token"];

          await box.write('token', token);
          print(response.body);
          Get.off(() => const HomeScreen());
        } else {
          showCustomSnackbar(
            message: "User Credential incorrect!",

            title: 'Error',
            position: SnackPosition.TOP,
            backgroundColor: Colors.black, // Background color
          );
        }
      } else {
        print(response);

        showCustomSnackbar(
          message: "User Credential incorrect!",

          title: 'Error',
          position: SnackPosition.TOP,
          backgroundColor: Colors.black, // Background color
        );
        // Error
        // print('Failed to send OTP');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      showCustomSnackbar(
        message: "An unexpected error occurred.",
        title: 'Error',
        position: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
    }
  }
}
