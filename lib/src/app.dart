import 'package:flutter/material.dart';

import '/../src/constants/name_routes_constants.dart';
import '/../src/constants/string_constants.dart';
import '/../src/routes/route_genertor.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NameRoutesConstants.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const Scaffold(
              body: Center(child: Text(StringConstants.notFound))),
        );
      },
    );
  }
}
