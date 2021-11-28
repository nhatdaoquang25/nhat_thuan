import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    double _titleFontSize = 25.0;
    double _iconBackSize = 30.0;
    double _padding = 5.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(StringConstants.titleDetailScreen,
            style: TextStyle(color: Colors.white, fontSize: _titleFontSize)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: _iconBackSize,
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
                padding: EdgeInsets.symmetric(horizontal: _padding),
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
                        currentPrice: state.coinDetail.currentPrice,
                        priceChangePercentage24H:
                            state.coinDetail.priceChangePercentage24H,
                        high24H: state.coinDetail.high24H,
                        low24H: state.coinDetail.low24H,
                        marketCap: state.coinDetail.marketCap,
                        circulatingSupply: state.coinDetail.circulatingSupply,
                        totalSupply: state.coinDetail.totalSupply,
                        maxSupply: state.coinDetail.maxSupply,
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
