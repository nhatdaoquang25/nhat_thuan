import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  List<Object?> get props => [];
}

class DetailRequested extends DetailEvent {}
