import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spenmax/views/home_screen.dart';
import 'package:spenmax/views/login_screen.dart';

final box = GetStorage();

void checkSessionAndNavigate() async {
  String? token = box.read('token');

  if (token != null) {
    Get.off(() => const HomeScreen());

    Get.back();
  } else {
    // Session ID doesn't exist, navigate to PhoneAuth
    Get.off(() => const LoginScreen());
  }
}
