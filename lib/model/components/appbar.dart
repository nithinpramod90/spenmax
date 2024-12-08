import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            SizedBox(height: 30, child: Image.asset('assets/images/logob.png')),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        )
      ],
      backgroundColor: const Color.fromARGB(255, 140, 197, 199),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
