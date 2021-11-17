import 'package:http/http.dart' as http;

import '/../src/models/coins.dart';

abstract class CoinService {
  final http.Client client;

  CoinService(this.client);

  Future<List<Coins>>? fecthCoins();
}
