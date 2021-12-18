import 'package:flutter/material.dart';

class ZaraScreen extends StatelessWidget {
  const ZaraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/logo/mallBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned(child: )
        ],
      ),
    );
  }
}
