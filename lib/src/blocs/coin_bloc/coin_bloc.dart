import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    on<CoinEvent>((event, emit) {});
  }
}
