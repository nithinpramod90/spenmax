import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';

class HomeController extends GetxController {
  final Api api = Api();
  var userDetails = {}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  // Fetch user details from API
  void fetchUserDetails() async {
    try {
      isLoading(true);
      final response = await api.fetchHomeDetails();
      userDetails.value = response;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Reload data
  void reloadData() {
    fetchUserDetails();
  }
}
