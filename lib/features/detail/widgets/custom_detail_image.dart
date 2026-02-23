import 'package:flutter/material.dart';
import 'package:grand_hotel/features/detail/pages/detail.dart';

class CustomDetailImage extends StatelessWidget {
  const CustomDetailImage({
    super.key,
    required this.widget,
  });

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.product.tag ?? '',
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.product.image ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.4),
              Colors.transparent,
            ],
            stops: const [0.0, 0.3],
          ),
        ),
      ),
    );
  }
}
