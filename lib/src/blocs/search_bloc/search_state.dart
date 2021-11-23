import 'package:equatable/equatable.dart';

import '../../models/coins.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchLoadInProgress extends SearchState {}

class SearchLoadSuccess extends SearchState {
  final List<Coins>? listCoins;

  const SearchLoadSuccess({this.listCoins});
  @override
  List<Object?> get props => [listCoins];
}

class SeachLoadFailure extends SearchState {
  final String? errorMessage;

  const SeachLoadFailure({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
