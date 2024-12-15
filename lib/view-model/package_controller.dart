import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';

class PackageController extends GetxController {
  var packages = [].obs;
  var isLoading = true.obs;
  var selectedType = 'BASIC'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPackages(); // Automatically fetch packages when the controller is initialized
  }

  void fetchPackages() async {
    try {
      print("Fetching packages for type: ${selectedType.value}");
      isLoading(true);
      final Api api = Api();
      final result = await api.fetchPackages(selectedType.value);

      if (result.isNotEmpty) {
        packages.value = result;
      } else {
        packages.value = []; // Empty result handling
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar('Error', 'Failed to load packages: $e');
      packages.value = []; // Reset packages in case of error
    } finally {
      isLoading(false);
    }
  }

  void selectType(String type) {
    selectedType.value = type;
    fetchPackages(); // Re-fetch when a new package type is selected
  }
}
