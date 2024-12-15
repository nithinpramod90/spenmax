import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width / 1,
          height: Get.height / 2,
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
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Your\nNotifications",
                  style: TextStyle(
                    color: Color.fromARGB(255, 79, 193, 197),
                    fontFamily: "Poppins",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 8,
              ),
              const Center(
                  child: Text(
                "No new notification",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
