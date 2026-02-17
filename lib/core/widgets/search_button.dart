import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/widgets/custom_search_bar.dart';
import 'package:grand_hotel/features/home/pages/search.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, SearchScreen());
      },
      child: AbsorbPointer(child: CustomSearchBar()),
    );
  }
}
