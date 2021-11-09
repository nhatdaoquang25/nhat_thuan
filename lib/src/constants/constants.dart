import 'package:flutter/material.dart';

class ColorConstant {
  static const Color primaryColor = Color(0xFFFFFFFF);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xFF17EAD9), Color(0xFF6078EA)],
  );
}

class NameRoutesConstant {
  static const String root = '/';
  static const String detailScreen = '/detail';
  static const String searchScreen = '/search';
}

class StringConstant {
  static const String titleCoinScreen = 'COIN';
  static const String titleDetailScreen = 'DETAIL SCREEN';
  static const String titleSearchScreen = 'SEARCH SCREEN';
}
