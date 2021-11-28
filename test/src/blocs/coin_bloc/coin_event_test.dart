import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_event.dart';

class EmptyEquatable extends Equatable {
  const EmptyEquatable();

  @override
  List<Object> get props => [];
}

void main() {
  test('Event CoinRequested', () {
    expect(CoinRequested(), CoinRequested());
  });

  test('Event CoinLoadMore', () {
    expect(CoinLoadMore(), CoinLoadMore());
  });
}
