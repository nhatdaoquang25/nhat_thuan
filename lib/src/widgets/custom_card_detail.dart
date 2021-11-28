import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

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
    final numberFormat = intl.NumberFormat("##0.0");
    double _coinFontSize = 25.0;
    double _currentPriceFontSize = 22.0;
    double _screenTextFontSize = 16.0;
    double _screenPadding = 10.0;
    double _widthSizeBox = 10.0;
    double _widthImage = 36.0;
    double _heightImage = 36.0;
    FontWeight _screenTextFontWeight = FontWeight.w500;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(_screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: _widthImage,
                  width: _heightImage,
                  margin: EdgeInsets.only(right: _screenPadding),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                      fontSize: _coinFontSize,
                      fontWeight: _screenTextFontWeight),
                ),
                SizedBox(
                  width: _widthSizeBox,
                ),
                Text(
                  '($symbol)'.toUpperCase(),
                  style: TextStyle(
                      fontSize: _coinFontSize,
                      fontWeight: _screenTextFontWeight),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _screenPadding,
              ),
              child: Row(
                children: [
                  Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(currentPrice))
                            .toString(),
                    style: TextStyle(
                        fontSize: _currentPriceFontSize,
                        fontWeight: _screenTextFontWeight),
                  ),
                  SizedBox(width: _widthSizeBox),
                  priceChangePercentage24H > 0
                      ? Icon(Icons.arrow_drop_up_outlined,
                          size: _currentPriceFontSize, color: Colors.green)
                      : Icon(Icons.arrow_drop_down_outlined,
                          size: _currentPriceFontSize, color: Colors.red),
                  Text(
                      '(' +
                          num.tryParse(
                                  numberFormat.format(priceChangePercentage24H))
                              .toString() +
                          '%)',
                      style: priceChangePercentage24H > 0
                          ? TextStyle(
                              fontSize: _currentPriceFontSize,
                              color: Colors.green)
                          : TextStyle(
                              fontSize: _currentPriceFontSize,
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
                        fontSize: _screenTextFontSize,
                        color: Colors.green,
                        fontWeight: _screenTextFontWeight)),
                Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(high24H)).toString(),
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        color: Colors.green,
                        fontWeight: _screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textLow,
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        color: Colors.red,
                        fontWeight: _screenTextFontWeight)),
                Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(low24H)).toString(),
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        color: Colors.red,
                        fontWeight: _screenTextFontWeight)),
              ],
            ),
            const CustomLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textMarketCap,
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
                Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(marketCap)).toString(),
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textCirculationSuplly,
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
                Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(circulatingSupply))
                            .toString(),
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textTotal,
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
                Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(totalSupply))
                            .toString(),
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.textMax,
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
                Text(
                    '\$ ' +
                        num.tryParse(numberFormat.format(maxSupply)).toString(),
                    style: TextStyle(
                        fontSize: _screenTextFontSize,
                        fontWeight: _screenTextFontWeight)),
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
                        fontSize: _currentPriceFontSize,
                        fontWeight: _screenTextFontWeight),
                  ),
                  SizedBox(
                    height: _widthSizeBox,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: _screenTextFontSize),
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
