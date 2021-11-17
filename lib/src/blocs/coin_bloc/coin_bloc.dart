import 'package:flutter_bloc/flutter_bloc.dart';
import '/../src/services/coin_service/coin_service.dart';

import '/../src/blocs/coin_bloc/coin_event.dart';
import '/../src/blocs/coin_bloc/coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinService? coinService;
  CoinBloc({this.coinService}) : super(CoinInitial()) {
    on<CoinRequested>((event, emit) async {
      try {
        emit(CoinLoadInProgress());

        emit(CoinLoadSucess(coins: await coinService!.fecthCoins()));
      } catch (e) {
        emit(CoinLoadFailure(errorMessage: e.toString()));
      }
    });
  }
}
