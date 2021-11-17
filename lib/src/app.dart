import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../src/blocs/coin_bloc/coin_bloc.dart';
import '/../src/screens/home_screen/home_screen.dart';
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: NameRoutesConstants.root,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CoinBloc(coinService: CoinServiceImpl(httpClient))
                    ..add(CoinRequested()),
            ),
          ],
          child: const HomeScreen(),
        ));
  }
}
