import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final String name;
  final num currentPrice;
  final num priceChange24h;
  final num priceChangePercentage24h;
  final String imageNetwork;

  const CustomCard(
      {Key? key,
      required this.index,
      required this.onTap,
      required this.name,
      required this.currentPrice,
      required this.priceChange24h,
      required this.priceChangePercentage24h,
      required this.imageNetwork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    double widthSizedBox = 50;
    double heightSizedBox = 50;

    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Container(
                height: sizeHeight / 15,
                width: sizeWidth / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
                child: Center(child: Text('${index + 1}')),
              ),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: widthSizedBox,
                    height: heightSizedBox,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        imageNetwork,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              priceChange24h > 0
                                  ? const Icon(
                                      Icons.arrow_drop_up_sharp,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.red,
                                    ),
                              Text(
                                '$priceChange24h ($priceChangePercentage24h%)',
                                style: priceChange24h > 0
                                    ? const TextStyle(
                                        fontSize: 16, color: Colors.green)
                                    : const TextStyle(
                                        fontSize: 16, color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '\$$currentPrice',
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
