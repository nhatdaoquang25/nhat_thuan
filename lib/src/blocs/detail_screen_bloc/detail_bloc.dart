import 'package:flutter_bloc/flutter_bloc.dart';
import '/../src/blocs/detail_screen_bloc/detail_event.dart';
import '/../src/blocs/detail_screen_bloc/detail_state.dart';
import '/../src/services/detail_service/detail_service.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final CoinDetailService? service;

  DetailBloc({this.service}) : super(DetailInitial()) {
    on<DetailRequested>((event, emit) async {
      try {
        emit(DetailLoadInProgress());
        emit(DetailLoadSuccess(await service!.fetchCoinsDetailScreen()));
      } catch (e) {
        emit(DetailLoadFailure(e.toString()));
      }
    });
  }
}
