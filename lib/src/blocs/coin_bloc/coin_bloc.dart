import 'package:flutter_bloc/flutter_bloc.dart';

import '/../src/blocs/coin_bloc/coin_event.dart';
import '/../src/blocs/coin_bloc/coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    on<CoinEvent>((event, emit) {});
  }
}
