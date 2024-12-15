import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spenmax/model/components/active_badge.dart';
import 'package:spenmax/view-model/branches_controller.dart';
import 'package:spenmax/view-model/home_controller.dart';
import 'package:spenmax/view-model/partner_filtercontroller.dart';
import 'package:spenmax/views/common/partner_grid.dart';

class PartnerWidge extends StatelessWidget {
  PartnerWidge({super.key});

  final HomeController controller = Get.put(HomeController());
  final TextEditingController _controller = TextEditingController();
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final BranchesController searchcontroller = Get.put(BranchesController());

  @override
  Widget build(BuildContext context) {
    final user = controller.userDetails;

    return Column(
      children: [
        ActiveBadge(
          package: user['package_c']?[0]['package_name'] ?? '',
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    "Partners",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Container(
                          height: 45,
                          width: Get.width / 1.1, // Adjust width as needed
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: _controller,
                                    decoration: const InputDecoration(
                                      hintText: "Search",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 119, 193, 196),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    searchcontroller.fetchBranchesData(
                                        search: _controller.text);
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 45,
                          width: Get.width / 1.8, // Adjust width as needed
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.grey),
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          child: DropdownButtonFormField<Map<String, dynamic>>(
                            menuMaxHeight: 200,
                            dropdownColor: Colors.white,
                            hint: const Text("Select a category"),
                            value: categoriesController.selectedCategory.value,
                            items: categoriesController.activeCategories
                                .map(
                                  (category) =>
                                      DropdownMenuItem<Map<String, dynamic>>(
                                    value: category,
                                    child: Text(
                                      category['name'],
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (Map<String, dynamic>? value) {
                              if (value != null) {
                                categoriesController.selectCategory(value);
                              }
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide.none, // Remove the bottom line
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                PartnerGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
