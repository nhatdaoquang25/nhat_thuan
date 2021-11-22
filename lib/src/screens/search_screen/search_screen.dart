import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search_bloc/search_bloc.dart';
import '../../blocs/search_bloc/search_event.dart';

import '../../blocs/search_bloc/search_state.dart';

import '../../constants/name_routes_constants.dart';
import '../../models/coins.dart';

import '/../src/constants/color_constants.dart';
import '/../src/constants/string_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  static String _displayStringForOption(Coins option) => option.name;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchRequested());
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    double spacerTop = sizeHeight / 10;
    double maxHeight = sizeHeight / 2;
    double sizedBoxWidth = sizeWidth / 12;

    double borderRaidus = 10.0;

    double paddingLeft = 5;
    double paddingRight = 25;

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
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          decoration:
              const BoxDecoration(gradient: ColorConstants.backgroundGradient),
          child: Column(
            children: [
              SizedBox(height: spacerTop),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SeachLoadFailure) {
                        return Center(
                          child: Text(state.errorMessage!),
                        );
                      }
                      if (state is SearchLoadSuccess) {
                        return Autocomplete<Coins>(
                          displayStringForOption: _displayStringForOption,
                          fieldViewBuilder: (context, textEditingController,
                              focusNode, onFieldSubmitted) {
                            return TextField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                                hintText: StringConstants.hintSearch,
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 20),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(borderRaidus),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                              ),
                            );
                          },
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<Coins>.empty();
                            }
                            return state.listCoins!.where((Coins option) {
                              return option.name
                                      .toString()
                                      .toLowerCase()
                                      .contains(textEditingValue.text
                                          .toLowerCase()) ||
                                  option.symbol
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          textEditingValue.text.toLowerCase());
                            });
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: paddingLeft, right: paddingRight),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(10),
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints(maxHeight: maxHeight),
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final Coins option =
                                            options.elementAt(index);
                                        return InkWell(
                                          onTap: () {
                                            onSelected(option);
                                            Navigator.of(context).pushNamed(
                                                NameRoutesConstants
                                                    .detailScreen);
                                          },
                                          child: ListTile(
                                            leading: SizedBox(
                                              width: sizedBoxWidth,
                                              child:
                                                  Image.network(option.image),
                                            ),
                                            title: Text(
                                              option.name.toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            trailing: const Icon(
                                              Icons.keyboard_arrow_right,
                                              size: 30,
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  )),
            ],
          ),
        ));
  }
}
