import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '../../blocs/coin_detail_bloc/coin_detail_bloc.dart';
import '../../blocs/coin_detail_bloc/coin_detail_event.dart';
import '../../blocs/coin_detail_bloc/coin_detail_state.dart';
import '/../src/widgets/custom_card_detail.dart';
import '/../src/constants/string_constants.dart';
import '/../src/constants/color_constants.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoinDetailBloc>(context).add(CoinDetailRequested(id: id));
    final percentageFormat = intl.NumberFormat("##0.0");
    return Scaffold(
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
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: BlocBuilder<CoinDetailBloc, CoinDetailState>(
        builder: (context, state) {
          if (state is CoinDetailLoadFailure) {
            return Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(state.errorMessage!),
            );
          }
          if (state is CoinDetailLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CoinDetailLoadSuccess) {
            return Container(
              decoration: const BoxDecoration(
                  gradient: ColorConstants.backgroundGradient),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 8,
                      child: CustomCardDetail(
                        id: state.coinDetail!.id,
                        symbol: state.coinDetail!.symbol,
                        name: state.coinDetail!.name,
                        image: state.coinDetail!.image,
                        description: state.coinDetail!.description,
                        currentPrice: num.tryParse(percentageFormat
                                .format(state.coinDetail!.currentPrice)) ??
                            num.parse(StringConstants.notApplicable),
                        priceChangePercentage24H: num.tryParse(
                                percentageFormat.format(state
                                    .coinDetail!.priceChangePercentage24H)) ??
                            num.parse(StringConstants.notApplicable),
                        high24H: num.tryParse(percentageFormat
                                .format(state.coinDetail!.high24H)) ??
                            num.parse(StringConstants.notApplicable),
                        low24H: num.tryParse(percentageFormat
                                .format(state.coinDetail!.low24H)) ??
                            num.parse(StringConstants.notApplicable),
                        marketCap: num.tryParse(percentageFormat
                                .format(state.coinDetail!.marketCap)) ??
                            num.parse(StringConstants.notApplicable),
                        circulatingSupply: num.tryParse(percentageFormat
                                .format(state.coinDetail!.circulatingSupply)) ??
                            num.parse(StringConstants.notApplicable),
                        totalSupply: num.tryParse(percentageFormat
                                .format(state.coinDetail!.totalSupply)) ??
                            num.parse(StringConstants.notApplicable),
                        maxSupply: num.tryParse(percentageFormat
                                .format(state.coinDetail!.maxSupply)) ??
                            num.parse(StringConstants.notApplicable),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container(
            color: Colors.orange,
          );
        },
      ),
    );
  }
}
