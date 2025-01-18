import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> offers;

  const OffersListWidget({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Available Offers",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xff668F9C),
            ),
          ),
          const SizedBox(height: 16),
          offers.isNotEmpty
              ? ListView.builder(
                  shrinkWrap:
                      true, // Ensures it doesn't scroll inside the container
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "${offer['offer']} (${offer['discount_type'].toUpperCase()})",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: Get.width / 1.8,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 62, 218, 68),
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: Colors.green, width: 1),
                              ),
                              child: Center(
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 25,
                                    child: Image.network(
                                        "https://users.spenmax.in/fire.png"),
                                  ),
                                  title: const Text(
                                    'Save With Spenmax',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Text(
                  "No offers available at the moment.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
        ],
      ),
    );
  }
}
