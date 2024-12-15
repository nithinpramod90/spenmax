import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spenmax/model/api/config.dart';
import 'package:http/http.dart' as http;
import 'package:spenmax/model/components/snackbar.dart';
import 'package:spenmax/views/home_screen.dart';
import 'package:spenmax/views/subscribtion_screen.dart';

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
        if (response.statusCode == 403) {
          Get.off(() => const SubscriptionScreen());
        }
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

  Future<Map<String, dynamic>> fetchHomeDetails() async {
    final String? token = await getSessionId();

    // if (token == null || token.isEmpty) {
    //   throw Exception('Session ID is invalid or expired.');
    // }

    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/customer/detail_update/user/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );
      // print('Response: ${response.body}');

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 403) {
          Get.off(() => const SubscriptionScreen());
        }
        throw Exception(
            'Failed to load customer details. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching home details: $e');
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> fetchNotifications() async {
    final String? token = await getSessionId();

    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/notification/user/'),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchNotificationCount() async {
    final String? token = await getSessionId();

    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/notification/count/user/'),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // Decode response and ensure it matches expected type
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          return data;
        } else if (data is List) {
          return data.isNotEmpty && data.first is Map<String, dynamic>
              ? data.first
              : null; // Handle List case
        }
      } else {
        print(
            "Failed to fetch notification count. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching notification count: $e");
      return null;
    }
    return null;
  }

  Future<List<dynamic>> fetchPackages(String type) async {
    final String? token = await getSessionId();

    try {
      print("api accesed");
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/package_option/user/?type=$type'),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchpartnercat() async {
    final String? token = await getSessionId();

    try {
      print("api accesed");
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/categories/'),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data as List).map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> fetchBranches(
      {String? category, String? search}) async {
    final String? token = await getSessionId();

    try {
      String url = '${AppConfig.baseUrl}/shop/vendor/branches/customer/';
      if (category != null) {
        url += '?category__name=$category';
      } else if (search != null) {
        url += '?search=$search';
      }
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load branches');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
