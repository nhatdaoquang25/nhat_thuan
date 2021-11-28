import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_seach_bar.dart';
import '../../blocs/search_bloc/search_bloc.dart';
import '../../blocs/search_bloc/search_event.dart';
import '../../blocs/search_bloc/search_state.dart';
import '/../src/constants/color_constants.dart';
import '/../src/constants/string_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchRequested());
    double sizeHeight = MediaQuery.of(context).size.height;

    double spacerTop = sizeHeight / 10;
    double paddingAll = 10.0;

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
            onPressed: () => Navigator.maybePop(context),
          ),
        ),
        body: Container(
          decoration:
              const BoxDecoration(gradient: ColorConstants.backgroundGradient),
          child: Column(
            children: [
              SizedBox(height: spacerTop),
              Padding(
                  padding: EdgeInsets.all(paddingAll),
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SeachLoadFailure) {
                        return Center(
                          child: Text(state.errorMessage!),
                        );
                      }
                      if (state is SearchLoadSuccess) {
                        return CustomSearchBar(
                          coinslist: state.listCoins,
                        );
                      }
                      return Container(
                        color: Colors.green,
                      );
                    },
                  )),
            ],
          ),
        ));
  }
}
