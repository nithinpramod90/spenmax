import 'package:get/get.dart';
import 'package:spenmax/model/api/api.dart';

class NotificationCountController extends GetxController {
  var notificationCount = 0.obs; // Observable for notification count
  final Api api = Api();

  @override
  void onInit() {
    super.onInit();
    fetchNotificationCount(); // Fetch count when the controller is initialized
  }

  Future<void> fetchNotificationCount() async {
    try {
      final response = await api.fetchNotificationCount();
      if (response != null && response['notification_count'] != null) {
        notificationCount.value = response['notification_count'];
      }
    } catch (e) {
      print("Error fetching notification count: $e");
    }
  }
}
