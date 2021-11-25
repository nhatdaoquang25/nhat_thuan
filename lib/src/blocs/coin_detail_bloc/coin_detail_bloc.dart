import 'package:flutter_bloc/flutter_bloc.dart';

import '/../src/services/detail_service/detail_service.dart';
import './coin_detail_event.dart';
import './coin_detail_state.dart';

class CoinDetailBloc extends Bloc<CoinDetailEvent, CoinDetailState> {
  final DetailService service;

  CoinDetailBloc({required this.service}) : super(CoinDetailInitial()) {
    on<CoinDetailRequested>((event, emit) async {
      try {
        emit(CoinDetailLoadInProgress());

        emit(CoinDetailLoadSuccess(
            coinDetail: await service.fetchCoinsDetailScreen(event.id)!));
      } catch (e) {
        emit(CoinDetailLoadFailure(e.toString()));
      }
    });
  }
}
