import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class DetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DetailAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DetailAppBarState extends State<DetailAppBar> {
  double appBarOpacity = 0.0;

  void _onScroll() {
    if (!mounted) return;
    
    double imageHeight = MediaQuery.of(context).size.height * 0.4;
    double appBarHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
    double threshold = imageHeight - appBarHeight;
    double newOpacity = (widget.scrollController.offset / threshold).clamp(0.0, 1.0);

    if (newOpacity != appBarOpacity) {
      setState(() {
        appBarOpacity = newOpacity;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final Color contentColor = Color.lerp(
    AppColors.white, 
    AppColors.grayScale100, 
    appBarOpacity,
  )!;

  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: appBarOpacity),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12 * appBarOpacity),
          blurRadius: 50,
          spreadRadius: 0,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: AppBar(
      backgroundColor: Colors.transparent, 
      elevation: 0,
      centerTitle: true,
      leading: BackButton(color: contentColor),
      title: Text("Detail", style: TextStyles.jostBody1.copyWith(color: contentColor)),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert_outlined, color: contentColor),
          onPressed: () {},
        ),
      ],
    ),
  );
}
}
