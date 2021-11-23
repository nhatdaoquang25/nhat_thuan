import 'package:equatable/equatable.dart';

abstract class CoinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinRequested extends CoinEvent {
  final int numberPage;

  CoinRequested({required this.numberPage});
  @override
  List<Object?> get props => [numberPage];
}

class CoinLoadMore extends CoinEvent {
  final int numberPage;

  CoinLoadMore({required this.numberPage});
  @override
  List<Object?> get props => [numberPage];
}
