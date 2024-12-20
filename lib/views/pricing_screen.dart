import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/welcome_text.dart';
import 'package:spenmax/view-model/package_controller.dart';

class PricingScreen extends StatelessWidget {
  PricingScreen({super.key});
  final PackageController controller = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WelcomeText(),

            // Package Type Buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFC6DEE1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "The packages\nfor your \nneeds",
                        style: TextStyle(
                          color: Color.fromARGB(255, 35, 150, 156),
                          fontFamily: "Poppins",
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFF2F5F6),
                          border: Border.all(
                            color: const Color(0xFFA0C9CB),
                          ),
                        ),
                        height: Get.height / 13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildPackageTypeButton(
                                'BASIC', 'BASIC', controller),
                            _buildPackageTypeButton(
                                'COMBO', 'COMBO', controller),
                            _buildPackageTypeButton('GRAND', 'ALL', controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Package List with ScrollView
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
              child: Container(
                color: const Color(0xFFC6DEE1),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.packages.isEmpty) {
                    return const Center(child: Text('No packages available'));
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Adjust number of columns as needed
                      childAspectRatio: 0.87,
                    ),
                    itemCount: controller.packages.length,
                    itemBuilder: (context, index) {
                      final package = controller.packages[index];
                      return _buildPackageCard(package);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildPackageTypeButton(
      String text, String type, PackageController controller) {
    return Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize:
                const Size(120.0, 48.0), // Set width and height as needed

            backgroundColor: controller.selectedType.value == type
                ? const Color.fromARGB(255, 35, 150, 156)
                : const Color(0xFFF2F5F6),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Adjust radius for curve intensity
            ),
          ),
          onPressed: () => controller.selectType(type),
          child: Text(
            text,
            style: TextStyle(
              color: controller.selectedType.value == type
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }

  Widget _buildPackageCard(dynamic package) {
    final packageDetail = package['package_detail'];
    List<dynamic> activeCategories = packageDetail['categories']
        .where((category) => category['is_active'] == true)
        .toList();

    return SizedBox(
      height: 150,
      width: 150, // Manually control width of each grid item
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                packageDetail['name'],
                style: const TextStyle(
                  color: Color.fromARGB(255, 35, 150, 156),
                  fontFamily: "Poppins",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                packageDetail['discription'],
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '₹${package['actual_price']}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '₹ ${package['discount_price']} ',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 35, 150, 156),
                      fontFamily: "Poppins",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "for ${package['duration_days']} days",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                "Features",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 120, // Fixed height for the features container
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: activeCategories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Text(
                              '•', // Bullet symbol
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              category['name'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Spacer(),
              // const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      const Size(120.0, 48.0), // Set width and height as needed
                  backgroundColor: const Color.fromARGB(255, 35, 150, 156),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Adjust radius for curve intensity
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Subscribe Now',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
