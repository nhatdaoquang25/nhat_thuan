import '/../src/models/detail_model.dart';

abstract class DetailState {
  List<Object?> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoadFailure extends DetailState {
  final String? errorMessage;

  DetailLoadFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class DetailLoadInProgress extends DetailState {}

class DetailLoadSuccess extends DetailState {
  final CoinDetail? coinDetailScreen;
  DetailLoadSuccess(this.coinDetailScreen);

  @override
  List<Object?> get props => [coinDetailScreen];
}
