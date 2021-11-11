import 'package:flutter/material.dart';

import '/../src/widgets/custom_card.dart';

import '/../src/constants/color_constants.dart';
import '/../src/constants/string_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHight = MediaQuery.of(context).size.height;
    double spacerTop = sizeHight / 10;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(StringConstants.titleSearchScreen,
              style: TextStyle(color: Colors.white, fontSize: 25)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          decoration:
              const BoxDecoration(gradient: ColorConstants.backgroundGradient),
          child: Column(
            children: [
              SizedBox(height: spacerTop),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                    hintText: StringConstants.hintSearch,
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: CustomCard(
                    index: 0,
                    onTap: () {},
                    name: "BTC",
                    imageNetwork:
                        "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png",
                    currentPrice: 6500,
                    priceChange24h: 12.2,
                    priceChangePercentage24h: 0.4,
                  ))
            ],
          ),
        ));
  }
}
