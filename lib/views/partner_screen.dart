import 'package:flutter/material.dart';
import 'package:spenmax/model/api/api.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/bottom_nav_bar.dart';
import 'package:spenmax/model/components/welcome_text.dart';
import 'package:spenmax/views/common/partner_widge.dart';

class PartnerSceen extends StatelessWidget {
  const PartnerSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeText(name: "Nikhil Rakesh"),
            const SizedBox(
              height: 10,
            ),
            PartnerWidge(),
            ElevatedButton(
                onPressed: () {
                  final Api api = Api();
                  print(api.fetchpartnercat());
                },
                child: const Text("data"))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
