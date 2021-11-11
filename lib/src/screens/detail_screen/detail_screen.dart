import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/../src/constants/string_constants.dart';
import '/../src/constants/color_constants.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(StringConstants.titleDetailScreen,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 6,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(CupertinoIcons.bitcoin_circle_fill,
                                  size: 66.0, color: Colors.orange),
                              Text(
                                'BitCoin (BTC)',
                                style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: const [
                                Text(
                                  '\$99999',
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                Icon(Icons.arrow_drop_up_outlined,
                                    size: 25.0, color: Colors.green),
                                Text(
                                  '9.9%',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              '+123',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.green),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: const BoxDecoration(
                                gradient: ColorConstants.backgroundGradient),
                            width: double.infinity,
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textHigh,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textLow,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: const BoxDecoration(
                                gradient: ColorConstants.backgroundGradient),
                            width: double.infinity,
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textAllTime,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textMarketCap,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textTradingVolume,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textCirculationSuplly,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textTotal,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(StringConstants.textMax,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Text('\$99.99',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: const BoxDecoration(
                                gradient: ColorConstants.backgroundGradient),
                            width: double.infinity,
                            height: 5.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  StringConstants.textDescription,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                                      'Lorem Ipsum has been the industrys standard dummy text '
                                      'ever since the 1500s, when an unknown printer took a galley of type and'
                                      'scrambled it to make a type specimen book. \n\n It has survived not only five centuries,'
                                      'but also the leap into electronic typesetting, remaining essentially unchanged.'
                                      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem'
                                      'Ipsum passages, and more recently with desktop publishing software like Aldus'
                                      'PageMaker including versions of Lorem Ipsum',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
