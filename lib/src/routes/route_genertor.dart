import 'package:flutter/material.dart';

import '/src/screens/detail_screen/detail_screen.dart';
import '/src/screens/search_screen/search_screen.dart';
import '/src/screens/home_screen/home_screen.dart';

import '/src/constants/constants.dart' as constants;

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case constants.NameRoutesConstant.root:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case constants.NameRoutesConstant.detailScreen:
        return MaterialPageRoute(builder: (_) => const DetailScreen());
      case constants.NameRoutesConstant.searchScreen:
        return MaterialPageRoute(builder: (_) => const SeachScreen());
    }
  }
}
