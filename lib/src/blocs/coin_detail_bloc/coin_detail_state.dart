import 'package:equatable/equatable.dart';

import '/../src/models/coins_detail.dart';

abstract class CoinDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinDetailInitial extends CoinDetailState {}

class CoinDetailLoadFailure extends CoinDetailState {
  final String? errorMessage;

  CoinDetailLoadFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CoinDetailLoadInProgress extends CoinDetailState {}

class CoinDetailLoadSuccess extends CoinDetailState {
  final CoinDetail? coinDetail;

  CoinDetailLoadSuccess({this.coinDetail});

  @override
  List<Object?> get props => [coinDetail];
}
