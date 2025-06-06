import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextEditingController controller;

  const AppTextIcon(
      {super.key,
      required this.icon,
      required this.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFBFC2DF)),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                border: InputBorder.none,
              ),
              style: AppTheme.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
