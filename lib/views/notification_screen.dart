import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/loader.dart';
import 'package:spenmax/model/components/welcome_text.dart';
import 'package:spenmax/view-model/notification_controller.dart';
import 'package:spenmax/views/common/no_notification.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: LottieLoader(),
          );
        }

        if (controller.notifications.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: NoNotification(),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width * 0.9, // Adjusted width
                  height: Get.height * 0.6, // Adjusted height
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 240, 239, 239),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, left: 16.0),
                        child: Text(
                          "Your Notifications",
                          style: TextStyle(
                            color: Color.fromARGB(255, 79, 193, 197),
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Added subtle spacing
                      Expanded(
                        // Allow notifications to use remaining space
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: controller.notifications.length,
                          itemBuilder: (context, index) {
                            final notification =
                                controller.notifications[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.notifications,
                                  color: Color.fromARGB(255, 111, 175, 183),
                                ),
                                title: const Text(
                                  'Message:',
                                  style: TextStyle(),
                                ),
                                subtitle: Text(
                                  notification['message'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
