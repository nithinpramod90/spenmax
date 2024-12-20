import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/view-model/notification_count_controller.dart';
import 'package:spenmax/views/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.leading});
  final NotificationCountController notificationController =
      Get.put(NotificationCountController()); // Inject controller
  final bool leading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              // boxShadow: const [
              //   BoxShadow(
              //     color: Color.fromARGB(255, 140, 197, 199),
              //     blurRadius: 10,
              //     spreadRadius: 2,
              //     offset: Offset(0, 5),
              //   ),
              // ],
              color: const Color(0xffC1DCDC),
              borderRadius: BorderRadius.circular(10)),
          child: AppBar(
            scrolledUnderElevation: 0,
            foregroundColor: Colors.black,
            automaticallyImplyLeading: leading,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                child: Image.asset('assets/images/logob.png'),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () async {
                        Get.to(() => NotificationScreen());
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Obx(() {
                        return Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${notificationController.notificationCount.value}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
            backgroundColor: const Color(0xffC1DCDC),
            elevation: 0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight) * 1.5;
}
