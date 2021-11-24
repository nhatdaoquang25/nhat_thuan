import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/../src/blocs/coin_bloc/coin_bloc.dart';
import '/../src/blocs/detail_screen_bloc/detail_bloc.dart';
import '/../src/blocs/search_bloc/search_bloc.dart';

import '/../src/constants/name_routes_constants.dart';
import '/../src/routes/route_genertor.dart';
import '/../src/services/coin_service/coin_service_impl.dart';
import '/../src/services/detail_service/app_detail_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  CoinBloc(coinService: CoinServiceImpl(httpClient))),
          BlocProvider(
              create: (context) =>
                  SearchBloc(coinService: CoinServiceImpl(httpClient))),
          BlocProvider(
              create: (context) =>
                  DetailBloc(service: AppDetailService(httpClient))),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: NameRoutesConstants.root,
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
