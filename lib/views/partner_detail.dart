import 'package:flutter/material.dart';
import 'package:spenmax/model/components/active_badge.dart';
import 'package:spenmax/model/components/appbar.dart';
import 'package:spenmax/model/components/welcome_text.dart';

class PartnerDetail extends StatelessWidget {
  const PartnerDetail({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(name: "Nikhil Rakeshh"),
          SizedBox(
            height: 10,
          ),
          ActiveBadge(
            package: 'Spenmax The Grand Package',
          )
        ],
      ),
    );
  }
}
