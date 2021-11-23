import 'package:flutter_bloc/flutter_bloc.dart';

import '/../../src/blocs/search_bloc/search_event.dart';
import '/../../src/blocs/search_bloc/search_state.dart';

import '../../services/coin_service/coin_service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final CoinService? coinService;

  SearchBloc({
    this.coinService,
  }) : super(SearchLoadInProgress()) {
    on<SearchRequested>((event, emit) async {
      try {
        var listCoins = await coinService!.fecthCoinsAll();
        emit(SearchLoadSuccess(listCoins: listCoins));
      } catch (e) {
        emit(SeachLoadFailure(errorMessage: e.toString()));
      }
    });
  }
}
