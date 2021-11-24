import 'package:flutter/material.dart';

import '../constants/name_routes_constants.dart';
import '../constants/string_constants.dart';

import '../models/coins.dart';

class CustomSearchBar extends StatelessWidget {
  final List<Coins> coinslist;

  const CustomSearchBar({Key? key, required this.coinslist}) : super(key: key);

  static String displayStringForOption(Coins option) => option.name;

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    double maxHeight = sizeHeight / 2;
    double sizedBoxWidth = sizeWidth / 12;

    double borderRaidus = 10.0;

    double paddingLeft = 5;
    double paddingRight = 25;

    return Autocomplete<Coins>(
      displayStringForOption: displayStringForOption,
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
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
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRaidus),
                borderSide: const BorderSide(color: Colors.grey)),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Coins>.empty();
        }
        return coinslist.where((Coins option) {
          return option.name
                  .toString()
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()) ||
              option.symbol
                  .toString()
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
        });
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Padding(
          padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(borderRaidus),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: maxHeight),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Coins option = options.elementAt(index);
                    return InkWell(
                      onTap: () {
                        onSelected(option);
                        Navigator.of(context).pushNamed(
                            NameRoutesConstants.detailScreen,
                            arguments: option.id);
                      },
                      child: ListTile(
                        leading: SizedBox(
                          width: sizedBoxWidth,
                          child: Image.network(option.image),
                        ),
                        title: Text(
                          option.name.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
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
}
