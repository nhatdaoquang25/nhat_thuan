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
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DetailBloc>().add(DetailRequested());
    final percentageFormat = intl.NumberFormat("##0.0");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                          id: state.coinDetailScreen!.id,
                          symbol: state.coinDetailScreen!.symbol,
                          name: state.coinDetailScreen!.name,
                          image: state.coinDetailScreen!.image,
                          description: state.coinDetailScreen!.description,
                          currentPrice: num.tryParse(percentageFormat.format(
                                  state.coinDetailScreen!.currentPrice)) ??
                              0,
                          priceChangePercentage24H: num.tryParse(
                                  percentageFormat.format(state
                                      .coinDetailScreen!
                                      .priceChangePercentage24H)) ??
                              0,
                          high24H: state.coinDetailScreen!.high24H,
                          low24H: state.coinDetailScreen!.low24H,
                          marketCap: state.coinDetailScreen!.marketCap,
                          circulatingSupply:
                              state.coinDetailScreen!.circulatingSupply,
                          totalSupply: state.coinDetailScreen!.totalSupply,
                          maxSupply: state.coinDetailScreen!.maxSupply,
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
      ),
    );
  }
}
