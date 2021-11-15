import 'package:flutter/material.dart';

import '/../src/constants/name_routes_constants.dart';
import '/../src/constants/string_constants.dart';

import '/../src/widgets/custom_card.dart';
import '/../src/constants/color_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Container(
          decoration:
              const BoxDecoration(gradient: ColorConstants.backgroundGradient),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 9,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5),
                        child: CustomCard(
                          index: index,
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(NameRoutesConstants.detailScreen);
                          },
                          name: "BTC",
                          imageNetwork:
                              "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png",
                          currentPrice: 6500.0,
                          priceChange24h: 13,
                          priceChangePercentage24h: 0.4,
                        ));
                  },
                ),
              )
            ],
          )),
    );
  }
}
