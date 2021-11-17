import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../src/blocs/coin_bloc/coin_bloc.dart';
import '/../src/services/coin_service/coin_service_impl.dart';

import '/../src/constants/name_routes_constants.dart';
import '/../src/routes/route_genertor.dart';
import 'package:http/http.dart' as http;

import 'blocs/coin_bloc/coin_event.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CoinBloc(coinService: CoinServiceImpl(httpClient))
                  ..add(CoinRequested()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: NameRoutesConstants.root,
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
