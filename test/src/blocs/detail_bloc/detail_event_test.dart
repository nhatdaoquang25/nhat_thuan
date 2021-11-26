import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_event.dart';

void main() {
  test('Event Coin Detail Requested', () {
    expect(
        CoinDetailRequested(id: 'bitcoin'), CoinDetailRequested(id: 'bitcoin'));
  });
}
