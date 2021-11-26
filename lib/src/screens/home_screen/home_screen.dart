import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '/../src/blocs/coin_bloc/coin_bloc.dart';
import '/../src/blocs/coin_bloc/coin_event.dart';
import '/../src/blocs/coin_bloc/coin_state.dart';
import '/../src/constants/color_constants.dart';
import '/../src/constants/name_routes_constants.dart';
import '/../src/constants/string_constants.dart';
import '/../src/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final percentageFormat = intl.NumberFormat("##0.0#");

  final double _paddingTopOfListView = 20;
  final double _paddingLeftOfCustomCard = 10;
  final double _paddingRightOfCustomCard = 10;
  final double _paddingBottomtOfCustomCard = 5;
  ScrollController controller = ScrollController();
  int index = 1;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
    BlocProvider.of<CoinBloc>(context).add(CoinRequested());
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(StringConstants.titleCoinScreen,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(NameRoutesConstants.searchScreen);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<CoinBloc>(context).add(CoinRequested());
        },
        child: BlocBuilder<CoinBloc, CoinState>(
          builder: (context, state) {
            if (state is CoinLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CoinLoadFailure) {
              return Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(state.errorMessage),
              );
            }
            if (state is CoinLoadSucess) {
              return Container(
                  decoration: const BoxDecoration(
                      gradient: ColorConstants.backgroundGradient),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 9,
                        child: ListView.builder(
                          controller: controller,
                          padding: EdgeInsets.only(top: _paddingTopOfListView),
                          itemCount: state.coins.length,
                          itemBuilder: (context, index) {
                            var coinIndex = state.coins[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: _paddingLeftOfCustomCard,
                                  right: _paddingRightOfCustomCard,
                                  bottom: _paddingBottomtOfCustomCard),
                              child: CustomCard(
                                index: index,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      NameRoutesConstants.detailScreen,
                                      arguments: coinIndex.id);
                                },
                                name: coinIndex.name,
                                imageNetwork: coinIndex.image,
                                currentPrice: coinIndex.currentPrice,
                                priceChange24h: num.tryParse(percentageFormat
                                        .format(coinIndex.priceChange24H)) ??
                                    0,
                                priceChangePercentage24h: num.tryParse(
                                        percentageFormat.format(coinIndex
                                            .priceChangePercentage24H)) ??
                                    0,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ));
            }
            return Container(
              color: Colors.green,
            );
          },
        ),
      ),
    );
  }

  void _scrollListener() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;
    if (currentScroll == maxScroll) {
      setState(() {
        BlocProvider.of<CoinBloc>(context).add(CoinLoadMore());
      });
    }
  }
}
