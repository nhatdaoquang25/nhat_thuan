import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nhat_thuan/src/models/coins.dart';
import 'package:nhat_thuan/src/widgets/custom_seach_bar.dart';

import '../mock/coins_mock_data.dart';

void main() {
  final mockResponse = json.decode(mockCoinsData);

  final coins =
      List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)));
  final Widget = MaterialApp(
    home: Scaffold(
      body: CustomSearchBar(coinslist: coins),
    ),
  );
}
