import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  List<Object?> get props => [];
}

class DetailRequested extends DetailEvent {
  final String id;

  DetailRequested({required this.id});
  @override
  List<Object?> get props => [id];
}
