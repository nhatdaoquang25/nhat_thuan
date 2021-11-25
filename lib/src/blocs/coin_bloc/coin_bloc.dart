import 'package:flutter_bloc/flutter_bloc.dart';

import '/../src/blocs/coin_bloc/coin_event.dart';
import '/../src/blocs/coin_bloc/coin_state.dart';
import '/../src/services/coin_service/coin_service.dart';
import '../../constants/value_constants.dart';
import '../../models/coins.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinService coinService;
  late List<Coins> _list = [];
  int numberPage = ValueConstants.defaultValue;
  CoinBloc({required this.coinService}) : super(CoinInitial()) {
    on<CoinRequested>((event, emit) async {
      try {
        emit(CoinLoadInProgress());
        numberPage = ValueConstants.defaultValue;
        _list = await coinService.fecthCoins(numberPage)!;
        emit(CoinLoadSucess(coins: _list));
        numberPage++;
      } catch (e) {
        emit(CoinLoadFailure(errorMessage: e.toString()));
      }
    });
    on<CoinLoadMore>((event, emit) async {
      try {
        var coins = await coinService.fecthCoins(numberPage);
        _list.addAll(coins!);
        emit(CoinLoadSucess(coins: _list));
        numberPage++;
      } catch (e) {
        emit(CoinLoadFailure(errorMessage: e.toString()));
      }
    });
  }
}
