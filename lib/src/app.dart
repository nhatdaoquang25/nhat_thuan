import 'package:flutter/material.dart';

import 'constants/constants.dart' as constants;
import 'routes/route_genertor.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: constants.NameRoutesConstant.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) =>
              const Scaffold(body: Center(child: Text('Not Found'))),
        );
      },
    );
  }
}
