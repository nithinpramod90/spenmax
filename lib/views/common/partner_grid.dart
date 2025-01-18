import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/loader.dart';
import 'package:spenmax/view-model/branches_controller.dart';
import 'package:spenmax/views/partner_detail.dart';

class PartnerGrid extends StatelessWidget {
  PartnerGrid({super.key});
  final BranchesController controller = Get.put(BranchesController());
  final BottomNavBarController navcontroller =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return SizedBox(
            height: Get.height * 0.4, // Constrain the height
            child: const Center(child: LottieLoader()));
      }
      if (controller.branches.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: Get.height * 0.4, // Constrain the height
            padding: const EdgeInsets.all(10), width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'No Category Found',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    navcontroller.navigateToScreen(1);

                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Get.size / 25,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Text color
                    side: const BorderSide(color: Colors.red), // Border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25.0), // Adjust border radius as needed
                    ),
                  ),
                  child: const Text(
                    'Clear Filter',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: Get.height * 0.5, // Constrain the height
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 1.90),
            itemCount: controller.branches.length,
            itemBuilder: (context, index) {
              final branch = controller.branches[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => PartnerDetail(id: branch['id'].toString()));
                  print(branch['id']);
                },
                child: Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust border radius as needed
                    side: const BorderSide(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                branch['company_name'],
                                maxLines: 1,
                                overflow: TextOverflow
                                    .ellipsis, // This ensures truncation with ellipsis
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              branch['category_name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Locality        ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: branch['Locality'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Ensures text truncates with ellipsis
                              maxLines: 1, // Limits text to one line
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'District         ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: branch['District'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'State            ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: branch['State'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() =>
                                    PartnerDetail(id: branch['id'].toString()));

                                print(branch['id']);

                                // Handle button press
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Get.size / 25,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white, // Text color
                                side: const BorderSide(
                                    color: Colors.black), // Border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // Adjust border radius as needed
                                ),
                              ),
                              child: const Text('Exclusive Offers'),
                            ),
                            const Spacer(),
                            const Text(
                              "Active",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
