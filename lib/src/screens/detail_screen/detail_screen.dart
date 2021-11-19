import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import '/../src/blocs/detail_screen_bloc/detail_bloc.dart';
import '/../src/blocs/detail_screen_bloc/detail_state.dart';
import '/../src/widgets/custom_card_detail.dart';
import '/../src/constants/string_constants.dart';
import '/../src/constants/color_constants.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          state.coinDetailScreen!.id,
                          state.coinDetailScreen!.symbol,
                          state.coinDetailScreen!.name,
                          state.coinDetailScreen!.image,
                          state.coinDetailScreen!.description,
                          num.tryParse(percentageFormat.format(
                                  state.coinDetailScreen!.currentPrice)) ??
                              0,
                          num.tryParse(percentageFormat.format(state
                                  .coinDetailScreen!
                                  .priceChangePercentage24H)) ??
                              0,
                          state.coinDetailScreen!.high24H,
                          state.coinDetailScreen!.low24H,
                          state.coinDetailScreen!.marketCap,
                          state.coinDetailScreen!.circulatingSupply,
                          state.coinDetailScreen!.totalSupply,
                          state.coinDetailScreen!.maxSupply,
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
