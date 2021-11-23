import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import '/../src/services/detail_service/app_detail_service.dart';

import '/../src/constants/name_routes_constants.dart';
import '/../src/constants/string_constants.dart';

import '/../src/routes/route_genertor.dart';

import '/../src/blocs/detail_screen_bloc/detail_bloc.dart';
import '/../src/blocs/detail_screen_bloc/detail_event.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                DetailBloc(service: AppDetailService(httpClient))
                  ..add(DetailRequested())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: NameRoutesConstants.root,
        onGenerateRoute: RouteGenerator.generateRoute,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => const Scaffold(
              body: Center(
                child: Text(StringConstants.notFound),
              ),
            ),
          );
        },
      ),
    );
  }
}
