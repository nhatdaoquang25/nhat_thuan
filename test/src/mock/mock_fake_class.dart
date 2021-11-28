import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_event.dart';
import 'package:nhat_thuan/src/blocs/coin_bloc/coin_state.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_event.dart';
import 'package:nhat_thuan/src/blocs/coin_detail_bloc/coin_detail_state.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_bloc.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_event.dart';
import 'package:nhat_thuan/src/blocs/search_bloc/search_state.dart';
import 'package:nhat_thuan/src/services/coin_service/coin_service.dart';
import 'package:nhat_thuan/src/services/detail_service/detail_service.dart';

class MockCoinDetailBloc extends MockBloc<CoinDetailEvent, CoinDetailState>
    implements CoinDetailBloc {}

class MockCoinDetailService extends Mock implements DetailService {}

class FakeCoinDetailState extends Fake implements CoinDetailState {}

class FakeCoinDetailEvent extends Fake implements CoinDetailEvent {}

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class MockSearchService extends Mock implements CoinService {}

class FakeSearchState extends Fake implements SearchState {}

class FakeSearchEvent extends Fake implements SearchEvent {}

class MockCoinsBloc extends MockBloc<CoinEvent, CoinState> implements CoinBloc {
}

class MockCoinsService extends Mock implements CoinService {}

class FakeCoinsState extends Fake implements CoinState {}

class FakeCoinsEvent extends Fake implements CoinEvent {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}
