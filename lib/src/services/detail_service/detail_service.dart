import 'package:http/http.dart' as http;

import '/../src/models/coins_detail.dart';

abstract class DetailService {
  final http.Client client;

  DetailService(this.client);

  Future<CoinDetail>? fetchCoinsDetailScreen();
}
