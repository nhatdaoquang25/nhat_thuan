import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/../src/blocs/coin_bloc/coin_bloc.dart';
import '/../src/services/coin_service/app_coin_service.dart';

import '/../src/screens/detail_screen/detail_screen.dart';
import '/../src/screens/search_screen/search_screen.dart';
import '/../src/constants/name_routes_constants.dart';
import '/../src/screens/home_screen/home_screen.dart';

import 'package:http/http.dart' as http;

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final httpClient = http.Client();
    switch (settings.name) {
      case NameRoutesConstants.root:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      CoinBloc(coinService: AppAlbumService(httpClient)),
                  child: const HomeScreen(),
                ));
      case NameRoutesConstants.detailScreen:
        return MaterialPageRoute(builder: (_) => const DetailScreen());
      case NameRoutesConstants.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
    }
  }
}
