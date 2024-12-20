import 'package:flutter/material.dart';
import 'package:spenmax/model/components/loader.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 250,
      width: 250,
      child: LottieLoader(),
    );
  }
}
