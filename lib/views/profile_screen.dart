import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/loader.dart';
import 'package:spenmax/view-model/home_controller.dart';
import 'package:spenmax/views/common/home_details.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 248, 250),
      appBar: CustomAppBar(
        leading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LottieLoader());
        }

        final user = controller.userDetails;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeContainer(
                  imageurl: user['image'] ?? 'null',
                  customerid: user['customer_id'] ?? '',
                  name: user['name'] ?? '',
                  purchasedate: user['package_c']?[0]['purchase_date'] ?? '',
                  expirydate: user['package_c']?[0]['expiry_date'] ?? '',
                  phone: user['number'] ?? '',
                  state: user['state'] ?? '',
                  district: user['district'] ?? '',
                  address: user['address'] ?? '',
                  country: user['country'] ?? '',
                  dob: user['dob'] ?? '',
                  email: user['email_id'] ?? '',
                  pin: user['pincode'] ?? '',
                  package: user['package_c']?[0]['package_name'] ?? '',
                  ishome: false,
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
