import 'package:flutter/material.dart';

import '/../src/constants/string_constants.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(StringConstants.notFound));
  }
}
