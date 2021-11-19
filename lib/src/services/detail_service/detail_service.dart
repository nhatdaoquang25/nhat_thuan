import 'package:http/http.dart' as http;
import '/../src/models/detail_model.dart';

abstract class CoinDetailService {
  final http.Client client;

  CoinDetailService(this.client);

  Future<CoinDetail>? fetchCoinsDetailScreen();
}
