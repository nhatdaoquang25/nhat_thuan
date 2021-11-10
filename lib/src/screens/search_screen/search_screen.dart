import 'package:flutter/material.dart';

import '/../src/constants/color_constants.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: ColorConstants.backgroundGradient,
        ),
      ),
    );
  }
}
