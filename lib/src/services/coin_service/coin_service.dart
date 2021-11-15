import 'package:http/http.dart' as http;
import 'package:nhat_thuan/src/models/coins.dart';

abstract class CoinService {
  final http.Client client;

  CoinService(this.client);
  Future<List<Coins>> fethCoins();
}
