import 'package:flutter_bloc/flutter_bloc.dart';

import '/../src/blocs/coin_bloc/coin_event.dart';
import '/../src/blocs/coin_bloc/coin_state.dart';
import '/../src/services/coin_service/coin_service.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinService? coinService;

  CoinBloc({this.coinService}) : super(CoinInitial()) {
    on<CoinRequested>((event, emit) async {
      try {
        emit(CoinLoadInProgress());

        var coins = await coinService!.fecthCoins(event.numberPage);
        emit(CoinLoadSucess(coins: coins));
      } catch (e) {
        emit(CoinLoadFailure(errorMessage: e.toString()));
      }
    });
  }
}
