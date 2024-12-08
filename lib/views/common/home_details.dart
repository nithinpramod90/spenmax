import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height,
      color: Color(0xFF7CA9AB),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GlassmorphicContainer(
            width: Get.width,
            height: Get.width,
            borderRadius: 10,
            blur: 20,
            alignment: Alignment.center,
            border: 0,
            linearGradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                Color.fromARGB(255, 255, 254, 254).withOpacity(0.2),
              ],
            ),
            borderGradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                Color.fromARGB(255, 255, 254, 254).withOpacity(0.2),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                Image.asset(
                  'assets/images/man.png', // Replace with your logo path
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 16,
                ),
                // Title
                const Text(
                  "test user",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                // Card details
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Customer Id: 5712457",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Elevated button with glassmorphic effect
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GlassmorphicContainer(
                    width: 160,
                    height: 50,
                    borderRadius: 25,
                    blur: 100,
                    alignment: Alignment.center,
                    border: 1,
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.1),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        // Add your action here
                      },
                      child: const Text(
                        "View Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
