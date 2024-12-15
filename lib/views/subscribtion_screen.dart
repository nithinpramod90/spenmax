import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/url.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC0DCDD),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width / 1.5,
                child: Image.asset("assets/images/expired.png"),
              ),
              SizedBox(
                height: Get.height / 16,
              ),
              const Text(
                "Subscription Over !",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: Get.height / 18,
              ),
              const Text(
                "Enjoy continued access by renewing your subscription.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () async {
                  privacyPolicy();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 25),
                  backgroundColor: Colors.black, // background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Purchase",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
