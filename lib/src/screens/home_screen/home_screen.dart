import 'package:flutter/material.dart';

import '/src/constants/constants.dart' as constants;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: constants.ColorConstant.backgroundGradient,
        ),
      ),
    );
  }
}
