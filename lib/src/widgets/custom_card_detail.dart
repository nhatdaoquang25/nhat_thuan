import 'package:flutter/material.dart';

import '/../src/constants/color_constants.dart';
import '/../src/constants/string_constants.dart';

class CustomCardDetail extends StatelessWidget {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final String description;
  final num currentPrice;
  final num priceChangePercentage24H;
  final num high24H;
  final num low24H;
  final num marketCap;
  final num circulatingSupply;
  final num totalSupply;
  final num maxSupply;

  const CustomCardDetail({
    Key? key,
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.description,
    required this.currentPrice,
    required this.priceChangePercentage24H,
    required this.high24H,
    required this.low24H,
    required this.marketCap,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double coinFontSize = 25.0;
    double currentPriceFontSize = 22.0;
    double screenTextFontSize = 16.0;
    double screenPadding = 10.0;
    double widthSizeBox = 10.0;
    double widthImage = 36.0;
    double heightImage = 36.0;
    FontWeight screenTextFontWeight = FontWeight.w500;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: widthImage,
                  width: heightImage,
                  margin: EdgeInsets.only(right: screenPadding),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                      fontSize: coinFontSize, fontWeight: screenTextFontWeight),
                ),
                SizedBox(
                  width: widthSizeBox,
                ),
                Text(
                  '($symbol)'.toUpperCase(),
                  style: TextStyle(
                      fontSize: coinFontSize, fontWeight: screenTextFontWeight),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenPadding,
              ),
              child: Row(
                children: [
                  Text(
                    '\$$currentPrice',
                    style: TextStyle(
                        fontSize: currentPriceFontSize,
                        fontWeight: screenTextFontWeight),
                  ),
                  SizedBox(width: widthSizeBox),
                  priceChangePercentage24H > 0
                      ? Icon(Icons.arrow_drop_up_outlined,
                          size: currentPriceFontSize, color: Colors.green)
                      : Icon(Icons.arrow_drop_down_outlined,
                          size: currentPriceFontSize, color: Colors.red),
                  Text('($priceChangePercentage24H%)',
                      style: priceChangePercentage24H > 0
                          ? TextStyle(
                              fontSize: currentPriceFontSize,
                              color: Colors.green)
                          : TextStyle(
                              fontSize: currentPriceFontSize,
                              color: Colors.red)),
                ],
              ),
            ),
            const CustomLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textHigh,
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        color: Colors.green,
                        fontWeight: screenTextFontWeight)),
                Text('\$ $high24H',
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        color: Colors.green,
                        fontWeight: screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textLow,
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        color: Colors.red,
                        fontWeight: screenTextFontWeight)),
                Text('\$ $low24H',
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        color: Colors.red,
                        fontWeight: screenTextFontWeight)),
              ],
            ),
            const CustomLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textMarketCap,
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
                Text('\$ $marketCap',
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textCirculationSuplly,
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
                Text('\$ $circulatingSupply',
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textTotal,
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
                Text('\$ $totalSupply',
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textMax,
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
                Text('\$ $maxSupply',
                    style: TextStyle(
                        fontSize: screenTextFontSize,
                        fontWeight: screenTextFontWeight)),
              ],
            ),
            const CustomLine(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.textDescription,
                    style: TextStyle(
                        fontSize: 22.0, fontWeight: screenTextFontWeight),
                  ),
                  SizedBox(
                    height: widthSizeBox,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: screenTextFontSize),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double linePadding = 10.0;
    double lineHeight = 5.0;
    return Container(
      margin: EdgeInsets.symmetric(vertical: linePadding),
      decoration:
          const BoxDecoration(gradient: ColorConstants.backgroundGradient),
      width: double.infinity,
      height: lineHeight,
    );
  }
}
