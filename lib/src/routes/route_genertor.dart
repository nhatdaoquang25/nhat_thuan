import 'package:flutter/material.dart';

import '/../src/constants/name_routes_constants.dart';
import '/../src/screens/detail_screen/detail_screen.dart';
import '/../src/screens/home_screen/home_screen.dart';
import '/../src/screens/not_found_screen/not_found_screen.dart';
import '/../src/screens/search_screen/search_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameRoutesConstants.root:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case NameRoutesConstants.detailScreen:
        var idCoin = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => DetailScreen(idCoin: idCoin));
      case NameRoutesConstants.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
