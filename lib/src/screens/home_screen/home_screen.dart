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

  double paddingTopOfListView = 20;
  double paddingLeftOfCustomCard = 10;
  double paddingRightOfCustomCard = 10;
  double paddingBottomtOfCustomCard = 5;

  late ScrollController controller;
  int i = 0;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
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
      body: BlocBuilder<CoinBloc, CoinState>(
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
              child: Text(state.errorMessage!),
            );
          }
          if (state is CoinLoadSucess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<CoinBloc>(context).add(CoinRequested());
              },
              child: Container(
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
                          padding: EdgeInsets.only(top: paddingTopOfListView),
                          itemCount: state.coins!.length,
                          itemBuilder: (context, index) {
                            var coinIndex = state.coins![index];
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: paddingLeftOfCustomCard,
                                    right: paddingRightOfCustomCard,
                                    bottom: paddingBottomtOfCustomCard),
                                child: CustomCard(
                                  index: index,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        NameRoutesConstants.detailScreen);
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
                                ));
                          },
                        ),
                      )
                    ],
                  )),
            );
          }
          return Container(
            color: Colors.green,
          );
        },
      ),
    );
  }

  void _scrollListener() {
    // ignore: avoid_print
    // print(controller.position.extentAfter);
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        i++;
      });
    }
  }
}
