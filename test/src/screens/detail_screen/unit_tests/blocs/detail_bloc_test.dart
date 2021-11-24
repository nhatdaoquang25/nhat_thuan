// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import 'package:nhat_thuan/src/blocs/detail_screen_bloc/detail_bloc.dart';
// import 'package:nhat_thuan/src/blocs/detail_screen_bloc/detail_event.dart';
// import 'package:nhat_thuan/src/blocs/detail_screen_bloc/detail_state.dart';
//
// import 'package:nhat_thuan/src/models/coins_detail.dart';
//
// import 'package:nhat_thuan/src/services/detail_service/detail_service.dart';
//
// class MockDetailService extends Mock implements DetailService {}
//
// main() {
//   DetailService detailService;
//   DetailBloc? detailBloc;
//   CoinDetail? coinDetail;
//
//   setUp(() {
//     detailService = MockDetailService();
//     detailBloc = DetailBloc(service: detailService);
//   });
//   tearDown(() {
//     detailBloc?.close();
//   });
//
//   blocTest('emits [] when no event is added',
//       build: () => DetailBloc(), expect: () => []);
//
//   blocTest(
//     'emits [AlbumLoadInProgress] then [AlbumLoadSucess] when [AlbumRequested] is called',
//     build: () {
//       detailService = MockDetailService();
//       return DetailBloc(service: detailService);
//     },
//     act: (DetailBloc bloc) => bloc.add(DetailRequested()),
//     expect: () => [
//       DetailLoadInProgress(),
//       DetailLoadSuccess(coinDetail),
//     ],
//   );
//   blocTest(
//     'emits [AlbumLoadFailure] when [AlbumRequested] is called and service throws error.',
//     build: () {
//       detailService = MockDetailService();
//       when(detailService.fetchCoinsDetailScreen()).thenThrow(Exception());
//       return DetailBloc(service: detailService);
//     },
//     act: (DetailBloc bloc) => bloc.add(DetailRequested()),
//     expect: () => [
//       DetailLoadInProgress(),
//       DetailLoadFailure(Exception().toString()),
//     ],
//   );
// }
