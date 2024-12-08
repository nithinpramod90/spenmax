import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SpenmaxCard extends StatelessWidget {
  const SpenmaxCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: Get.width,
      height: 250,
      borderRadius: 10,
      blur: 20,
      alignment: Alignment.center,
      border: 1,
      linearGradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 77, 85, 85),
          Color.fromARGB(255, 125, 129, 129),
        ],
        stops: [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color.fromARGB(255, 62, 156, 141).withOpacity(0.5),
          Colors.black.withOpacity(0.1),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 0,
            child: Image.asset(
              'assets/images/Vector.png', // Replace with your logo path
              width: 100,
              height: 40,
            ),
          ),
          // Title
          const Positioned(
            top: 20,
            left: 85,
            child: Text(
              "Spenmax Lifestyle + Services",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),

          // Card details
          const Positioned(
            top: 80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customer Id",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "* * * *  * * * *  * * * *  3 4 5 6",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "12/25",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          // Logo
          Positioned(
            bottom: 15,
            right: 15,
            child: Image.asset(
              'assets/images/logob.png', // Replace with your logo path
              width: 100,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
