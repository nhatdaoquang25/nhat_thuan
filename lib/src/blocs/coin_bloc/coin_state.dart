import 'package:equatable/equatable.dart';

import '/../src/models/coins.dart';

abstract class CoinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinInitial extends CoinState {}

class CoinLoadFailure extends CoinState {
  final String? errorMessage;

  CoinLoadFailure({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class CoinLoadInProgress extends CoinState {}

class CoinLoadSucess extends CoinState {
  final List<Coins>? coins;

  CoinLoadSucess({this.coins});

  @override
  List<Object?> get props => [coins];
}
