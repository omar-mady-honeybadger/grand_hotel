import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/functions/search.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/custom_search_bar.dart';
import 'package:grand_hotel/features/detail/pages/detail.dart';
import 'package:grand_hotel/core/widgets/section_header.dart';
import 'package:grand_hotel/features/home/widgets/recently_viewed.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  String _searchQuery = '';
  List<ProductModel> filteredProducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CustomSearchBar(
                    focusNode: _searchFocusNode,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                        if (_searchQuery.isEmpty) {
                          filteredProducts = [];
                        } else {
                          filteredProducts = getProductByName(_searchQuery);
                        }
                      });
                    },
                  ),
                ),
                if (_searchQuery.isNotEmpty) ...[
                  ListView.builder(
                    itemCount: filteredProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                           pushTo(context, ProductDetailScreen(product: product,));
                        },
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Hero(
                              tag: product.tag?? '',
                              child: Image.asset(
                                product.image ?? '',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            product.name ?? '',
                            style: TextStyles.jostBody3,
                          ),
                          subtitle: Text(
                            product.location ?? '',
                            style: TextStyles.jostBody4.copyWith(
                              color: AppColors.grayScale60,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${product.price}',
                                style: TextStyles.jostBody3.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.warning,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${product.review}',
                                    style: TextStyles.jostBody4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SectionHeader(
                      label: 'Recent Searches',
                      textButtonLabel: 'Clear All',
                      textButtonColor: AppColors.error,
                      onPressed: () {
                        setState(() {
                          recentSearches.clear();
                        });
                      },
                    ),
                  ),
                  ListView.builder(
                    itemCount: recentSearches.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = recentSearches[index];
                      return ListTile(
                        leading: SvgPicture.asset(AppAssets.clockSvg),
                        title: Text(
                          product.name ?? '',
                          style: TextStyles.jostBody3,
                        ),
                        subtitle: Text(
                          product.location ?? '',
                          style: TextStyles.jostBody4.copyWith(
                            color: AppColors.grayScale60,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 14.0,
                      bottom: 6.0,
                      right: 24.0,
                      left: 24.0,
                    ),
                    child: SectionHeader(
                      label: 'Recently Viewed',
                      textButtonLabel: 'See All',
                    ),
                  ),
                  RecentlyViewed(productList: recentlyViewedProducts),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
