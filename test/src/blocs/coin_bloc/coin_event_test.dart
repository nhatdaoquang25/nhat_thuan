import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_event.dart';

void main() {
  test('Event CoinRequested', () {
    expect(CoinRequested(numberPage: 1), CoinRequested(numberPage: 1));
  });

  test('Event CoinLoadMore', () {
    expect(CoinLoadMore(numberPage: 1), CoinLoadMore(numberPage: 1));
  });
}
