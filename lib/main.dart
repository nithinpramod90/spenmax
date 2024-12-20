import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spenmax/views/pricing_screen.dart';
import 'package:spenmax/views/home_screen.dart';
import 'package:spenmax/views/partner_screen.dart';
import 'package:spenmax/views/profile_screen.dart';
import 'package:spenmax/views/splash_screen.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Center(
      child: Text(
        "Subscription Expired",
      ),
    );
  };
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 148, 183)),
        useMaterial3: true,
      ),
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(
      //       textScaler: TextScaler.linear(0.8), // Disable text scaling globally
      //     ),
      //     child: child!,
      //   );
      // },
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/partners', page: () => const PartnerSceen()),
        GetPage(name: '/pricing', page: () => PricingScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
    );
  }
}
