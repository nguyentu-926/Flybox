import 'package:flutter/material.dart';

class SearchTabsWidget extends StatelessWidget {
  final String tabText;
  final bool tabBorder;
  final Color tabColor;
  final VoidCallback? onTap;

  const SearchTabsWidget(
      {super.key,
      this.tabText = "",
      this.tabBorder = false,
      this.tabColor = Colors.white,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        width: size.width * .44,
        child: Center(child: Text(tabText)),
        decoration: BoxDecoration(
          color: tabColor,
          borderRadius: tabBorder
              ? BorderRadius.horizontal(right: Radius.circular(46))
              : BorderRadius.horizontal(left: Radius.circular(46)),
        ),
      ),
    );
  }
}
