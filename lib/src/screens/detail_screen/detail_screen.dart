import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '/../src/blocs/detail_screen_bloc/detail_event.dart';
import '/../src/blocs/detail_screen_bloc/detail_bloc.dart';
import '/../src/blocs/detail_screen_bloc/detail_state.dart';
import '/../src/widgets/custom_card_detail.dart';
import '/../src/constants/string_constants.dart';
import '/../src/constants/color_constants.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DetailBloc>().add(DetailRequested(id: id));
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoadFailure) {
            return Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(state.errorMessage!),
            );
          }
          if (state is DetailLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailLoadSuccess) {
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
                        id: state.coinDetail.id,
                        symbol: state.coinDetail.symbol,
                        name: state.coinDetail.name,
                        image: state.coinDetail.image,
                        description: state.coinDetail.description,
                        currentPrice: num.tryParse(percentageFormat
                                .format(state.coinDetail.currentPrice)) ??
                            0,
                        priceChangePercentage24H: num.tryParse(
                                percentageFormat.format(state
                                    .coinDetail.priceChangePercentage24H)) ??
                            0,
                        high24H: num.tryParse(percentageFormat
                                .format(state.coinDetail.high24H)) ??
                            0,
                        low24H: num.tryParse(percentageFormat
                                .format(state.coinDetail.low24H)) ??
                            0,
                        marketCap: num.tryParse(percentageFormat
                                .format(state.coinDetail.marketCap)) ??
                            0,
                        circulatingSupply: num.tryParse(percentageFormat
                                .format(state.coinDetail.circulatingSupply)) ??
                            0,
                        totalSupply: num.tryParse(percentageFormat
                                .format(state.coinDetail.totalSupply)) ??
                            0,
                        maxSupply: num.tryParse(percentageFormat
                                .format(state.coinDetail.maxSupply)) ??
                            0,
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
