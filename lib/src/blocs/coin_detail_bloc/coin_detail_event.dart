import 'package:equatable/equatable.dart';

abstract class CoinDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinDetailRequested extends CoinDetailEvent {
  final String id;

  CoinDetailRequested({required this.id});
  @override
  List<Object?> get props => [id];
}
