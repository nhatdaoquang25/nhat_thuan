import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhat_thuan/src/models/coins.dart';

import '/../src/blocs/coin_bloc/coin_event.dart';
import '/../src/blocs/coin_bloc/coin_state.dart';
import '/../src/services/coin_service/coin_service.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinService? coinService;
  List<Coins>? list = [];
  bool isLoading = false;

  CoinBloc({this.coinService}) : super(CoinInitial()) {
    on<CoinRequested>((event, emit) async {
      try {
        emit(CoinLoadInProgress());
        list = await coinService!.fecthCoins(event.numberPage);
        emit(CoinLoadSucess(coins: list));
      } catch (e) {
        emit(CoinLoadFailure(errorMessage: e.toString()));
      }
    });
    on<CoinLoadMore>((event, emit) async {
      try {
        var coins = await coinService!.fecthCoins(event.numberPage);
        list!.addAll(coins!);
        emit(CoinLoadSucess(coins: list));
      } catch (e) {
        emit(CoinLoadFailure(errorMessage: e.toString()));
      }
    });
  }
}
