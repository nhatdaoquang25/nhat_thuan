import 'package:equatable/equatable.dart';

abstract class CoinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinRequested extends CoinEvent {
  final int numberPage;

  CoinRequested({required this.numberPage});
}
