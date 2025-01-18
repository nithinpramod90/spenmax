import 'dart:convert';
import 'dart:io';

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
    await box.remove('name');
    print('bnbbn ID deleted');
  }

  Future<String?> getname() async {
    return box.read('name');
  }

  Future<void> deletename() async {
    await box.remove('name');
    print('name ID deleted');
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
          final String name = responseData['name'];
          await box.write('token', token);
          await box.write('name', name);

          print(response.body);

          Get.off(() => const HomeScreen());
        } else {
          print(email);
          print(password);
          print(responseData);
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

    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/customer/detail_update/user/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Response: ${response.body}');

        // Check if 'package_c' is empty
        if (responseData['package_c'] == null ||
            responseData['package_c'].isEmpty) {
          Get.off(() => const SubscriptionScreen());
          return {}; // Return an empty map as the user is redirected
        }

        return responseData;
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

  Future<Map<String, dynamic>> updateCustomerDetails({
    required String name,
    required String phone,
    required String district,
    required String state,
    required String address,
    required String dob,
    required String email,
    required String pincode,
    required String country,
  }) async {
    final String? token = await getSessionId();

    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/shop/customer/detail_update/user/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'district': district,
          'state': state,
          'address': address,
          'dob': dob,
          'email': email,
          'pincode': pincode,
          'country': country,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Update successssful: ${response.body}');
        return responseData;
      } else {
        if (response.statusCode == 403) {
          Get.off(() => const SubscriptionScreen());
        }
        throw Exception(
            'Failed to update customer details. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating customer details: $e');
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
      print(url);
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

  Future<Map<String, dynamic>> fetchPartnerDetails(String id) async {
    final String? token = await getSessionId();

    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/shop/vendor/branches/customer/$id/'),
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
        throw Exception(
            'Failed to load customer details. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching home details: $e');
      throw Exception('Error: $e');
    }
  }

  Future<void> forgetpassword(String email) async {
    final url = Uri.parse('${AppConfig.baseUrl}/user/forgot/');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email_id': email,
        }),
      );
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
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

  Future<void> usersignup(
    String name,
    String email,
    String phone,
    String dob,
    String address,
    String pincode,
    String password,
    String country,
    String state,
    String district,
  ) async {
    final url = Uri.parse('${AppConfig.baseUrl}/user/register/');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'image': null,
          'name': name,
          'number': phone,
          'pincode': pincode,
          'username': email,
          'dob': dob,
          'district': district,
          'state': state,
          'country': country,
          'address': address,
          'password': password
        }),
      );
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        await authenticate(email, password);
      } else {
        print(response);
        print(responseData);
        print(response.body);

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

  Future<bool> uploadImage(String uid, File image) async {
    final String? token = await getSessionId();
    print('${AppConfig.baseUrl}/shop/customer/photo/$uid/update/user/');
    final url =
        Uri.parse('${AppConfig.baseUrl}/shop/customer/photo/$uid/update/user/');
    final request = http.MultipartRequest('PUT', url)
      ..headers['Authorization'] = 'Token $token'
      ..files.add(
        await http.MultipartFile.fromPath('image', image.path),
      );

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully!');

        return true;
      } else {
        print('Failed to upload image. Status code: $response');
        final errorResponse = await http.Response.fromStream(response);
        print(errorResponse.body);

        return false;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return false;
    }
  }
}
