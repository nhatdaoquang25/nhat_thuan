import 'package:flutter/material.dart';

import '/../src/screens/detail_screen/detail_screen.dart';
import '/../src/screens/search_screen/search_screen.dart';
import '/../src/screens/home_screen/home_screen.dart';

import '/../src/constants/name_routes_constants.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameRoutesConstants.root:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case NameRoutesConstants.detailScreen:
        return MaterialPageRoute(builder: (_) => const DetailScreen());
      case NameRoutesConstants.searchScreen:
        return MaterialPageRoute(builder: (_) => const SeachScreen());
    }
  }
}
