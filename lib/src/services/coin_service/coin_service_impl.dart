import 'dart:convert';

import 'package:http/http.dart' as http;

import '/../src/config/app_config.dart';
import '/../src/config/constants.dart';

import '/../src/models/coins.dart';
import '/../src/services/coin_service/coin_service.dart';

class CoinServiceImpl extends CoinService {
  CoinServiceImpl(http.Client client) : super(client);

  @override
  Future<List<Coins>> fecthCoins() async {
    Map<String, String> queryParameters = {
      AppConfig.instance.getValue(AppConstants.currency):
          AppConstants.currencyOfMarket,
      AppConfig.instance.getValue(AppConstants.perPage):
          AppConstants.amountPerPage,
      AppConfig.instance.getValue(AppConstants.page): AppConstants.numberPage,
    };

    final uri = Uri(
        scheme: 'https',
        host: AppConfig.instance.getValue(AppConstants.hostName),
        path: AppConfig.instance.getValue(AppConstants.coinPath) +
            AppConfig.instance.getValue(AppConstants.marketPath),
        queryParameters: queryParameters);

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      Iterable responseList = json.decode(response.body);

      var coins =
          List<Coins>.from(responseList.map((model) => Coins.fromJson(model)));

      return coins;
    } else {
      throw Exception('Failed to load coin list');
    }
  }
}
