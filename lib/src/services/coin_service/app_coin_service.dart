import 'dart:convert';

import 'package:http/http.dart' as http;
import '/../src/config/app_config.dart';
import '/../src/config/constants.dart';

import '/../src/models/coins.dart';
import '/../src/services/coin_service/coin_service.dart';

class AppAlbumService extends CoinService {
  AppAlbumService(http.Client client) : super(client);

  @override
  Future<List<Coins>> fecthCoins() async {
    Map<String, String> qParams = {
      AppConfig.instance.getValue(AppConstants.currency): 'usd',
      AppConfig.instance.getValue(AppConstants.order): 'market_cap_desc',
      AppConfig.instance.getValue(AppConstants.perPage): '20',
      AppConfig.instance.getValue(AppConstants.page): '1',
      AppConfig.instance.getValue(AppConstants.sparkline): 'false',
    };

    final uri = Uri(
        scheme: 'https',
        host: AppConfig.instance.getValue(AppConstants.hostName),
        path: AppConfig.instance.getValue(AppConstants.coinPath) +
            AppConfig.instance.getValue(AppConstants.marketPath),
        queryParameters: qParams);

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
