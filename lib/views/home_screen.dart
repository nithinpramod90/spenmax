import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/card.dart';
import 'package:spenmax/model/components/card_format.dart';
import 'package:spenmax/model/components/loader.dart';
import 'package:spenmax/model/components/welcome_text.dart';
import 'package:spenmax/view-model/home_controller.dart';
import 'package:spenmax/views/common/home_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
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
                WelcomeText(),
                const SizedBox(height: 28),
                SpenmaxCard(
                  package: (user['package_c'] != null &&
                          user['package_c'].isNotEmpty)
                      ? user['package_c'][0]['package_name']
                      : 'Package Expired',
                  name: user['name'] ?? '',
                  customerid: formatCustomerId(user['customer_id']),
                  expiry: (user['package_c'] != null &&
                          user['package_c'].isNotEmpty)
                      ? user['package_c'][0]['expiry_date']
                      : 'Expired',
                ),
                const SizedBox(height: 28),
                // HomeContainer(
                //   imageurl: user['image'] ?? 'null',
                //   customerid: user['customer_id'] ?? '',
                //   name: user['name'] ?? '',
                //   expirydate: (user['package_c'] != null &&
                //           user['package_c'].isNotEmpty)
                //       ? user['package_c'][0]['expiry_date']
                //       : 'Expired',
                //   purchasedate: (user['package_c'] != null &&
                //           user['package_c'].isNotEmpty)
                //       ? user['package_c'][0]['purchase_date']
                //       : 'Expired',
                //   phone: user['number'] ?? '',
                //   state: user['state'] ?? '',
                //   district: user['district'] ?? '',
                //   address: user['address'] ?? '',
                //   country: user['country'] ?? '',
                //   dob: user['dob'] ?? '',
                //   email: user['email_id'] ?? '',
                //   pin: user['pincode'] ?? '',
                //   package: (user['package_c'] != null &&
                //           user['package_c'].isNotEmpty)
                //       ? user['package_c'][0]['package_name']
                //       : 'Expired',
                //   ishome: true,
                // ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
