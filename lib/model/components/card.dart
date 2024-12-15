import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpenmaxCard extends StatelessWidget {
  const SpenmaxCard(
      {super.key,
      required this.package,
      required this.expiry,
      required this.customerid,
      required this.name});
  final String package;
  final String expiry;
  final String customerid;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 250,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 8, 82, 78).withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
          color: const Color(0xff657575),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 17,
            left: 0,
            child: Image.asset(
              'assets/images/Vector.png',
              width: 100,
              height: 40,
            ),
          ),
          // Title
          Positioned(
            top: 20,
            left: 85,
            child: Text(
              package,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),

          // Card details
          Positioned(
            top: 70,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  customerid,
                  style: const TextStyle(
                    wordSpacing: 12,
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 65),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Card Holder Name",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Expiry Date",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          expiry,
                          style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 14,
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
              width: 90,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
