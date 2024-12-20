import 'package:flutter/material.dart';
import 'package:spenmax/model/api/api.dart';

class WelcomeText extends StatelessWidget {
  WelcomeText({super.key});

  final Api api = Api();

  Future<String?> getName() async {
    return await api.getname();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<String?>(
        future: getName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text("Error loading name");
          } else {
            final name = snapshot.data ?? "Guest";
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Welcome,",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
