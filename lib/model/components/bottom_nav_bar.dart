import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;

    // Navigate to the corresponding screen
    switch (index) {
      case 0:
        Get.offNamedUntil('/home', (route) => route.isFirst);
        break;
      case 1:
        Get.offNamedUntil('/partners', (route) => route.isFirst);
        break;
      case 2:
        Get.offNamedUntil('/pricing', (route) => route.isFirst);
        break;
      case 3:
        Get.offNamedUntil('/profile', (route) => route.isFirst);
        break;
    }
  }

  void navigateToScreen(int index) {
    changeTabIndex(index); // Update index and navigate
  }
}

class BottomNavBar extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: const Color(0xffC1DCDC),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: const Color(0xffC1DCDC),
              gap: 8,
              activeColor: Colors.black,
              iconSize: 18,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color(0xffC1DCDC),
              color: Colors.black,
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.group, text: 'Partners'),
                GButton(icon: Icons.currency_rupee, text: 'Pricing'),
                GButton(icon: Icons.account_circle, text: 'Profile'),
              ],
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) {
                controller.changeTabIndex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
