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
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(name: 'Nikhil Rakesh'),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: NoNotification(),
              ),
            ],
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                title: Text(
                  notification['message'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('Updated Offer Details'),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
