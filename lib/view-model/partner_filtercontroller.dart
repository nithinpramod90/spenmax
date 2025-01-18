import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/model/components/space_fixer.dart';
import 'package:spenmax/view-model/branches_controller.dart';

class CategoriesController extends GetxController {
  var activeCategories = <Map<String, dynamic>>[].obs;
  var selectedCategory = Rx<Map<String, dynamic>?>(null);
  var isDropdownVisible = false.obs; // Controls the visibility of the dropdown

  final Api api = Api();
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      final List<Map<String, dynamic>> data = await api.fetchpartnercat();
      // Filter where is_active is true
      activeCategories.value = data;
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  void selectCategory(Map<String, dynamic> category) {
    selectedCategory.value = category;
    final BranchesController controller = Get.put(BranchesController());

    final String replaced = replaceSpacesWithPercent20('${category['name']}');
    print("Selected ID: $replaced");
    isDropdownVisible.value = false;
    controller.fetchBranchesData(category: replaced);
  }

  void toggleDropdown() {
    isDropdownVisible.value = !isDropdownVisible.value;
  }
}
