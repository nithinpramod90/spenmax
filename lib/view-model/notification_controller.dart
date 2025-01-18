import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';

class NotificationController extends GetxController {
  var notifications = [].obs; // Observable list to store notifications
  var isLoading = false.obs; // Loader state
  final Api api = Api();
  // Function to fetch notifications
  Future<void> fetchNotifications() async {
    isLoading.value = true;
    try {
      final List<dynamic> data = await api.fetchNotifications();
      notifications.value = data;
    } catch (e) {
      // Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchNotifications(); // Fetch data when the controller is initialized
    super.onInit();
  }
}
