import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '/../src/config/app_config.dart';
import '/../src/config/constants.dart';
import '/../src/models/detail_model.dart';
import '/../src/services/detail_service/detail_service.dart';

class AppCoinDetailService extends CoinDetailService {
  AppCoinDetailService(http.Client client) : super(client);

  @override
  Future<CoinDetail> fetchCoinsDetailScreen() async {
    final uri = Uri(
      scheme: 'https',
      host: AppConfig.instance.getValue(AppConstants.HOST_NAME),
      path: AppConfig.instance.getValue(AppConstants.COINS_PATH) + "/bitcoin",
    );

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var detail = json.decode(response.body);

      return CoinDetail.fromJson(detail);
    } else {
      throw Exception('Failed to load album list');
    }
  }
}
