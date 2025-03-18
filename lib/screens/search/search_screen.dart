import 'package:flightbookapp/core/res/app_media.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flightbookapp/core/widgets/app_texts.dart';
import 'package:flightbookapp/screens/search/widgets/app_text_icon.dart';
import 'package:flightbookapp/screens/search/widgets/find_tickets.dart';
import 'package:flightbookapp/screens/search/widgets/tickets_tabs.dart';
import 'package:flightbookapp/screens/search/widgets/ticket_promotion.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Chuyến bay bạn tìm kiếm",
            style: AppTheme.headLineStyle1.copyWith(fontSize: 32),
          ),
          SizedBox(
            height: 20,
          ),
          TicketsTabs(
            firstTab: "Đặt vé",
            secondTab: "Địa điểm",
          ),
          SizedBox(
            height: 24,
          ),
          AppTextIcon(
            icon: Icons.flight_takeoff_rounded,
            text: "Khởi hành",
          ),
          SizedBox(
            height: 20,
          ),
          AppTextIcon(
            icon: Icons.flight_land_rounded,
            text: "Điểm đến",
          ),
          SizedBox(
            height: 24,
          ),
          FindTickets(),
          SizedBox(
            height: 40,
          ),
          AppTexts(
            titleText: "Chuyến bay sắp tới",
            descText: "xem tất cả",
            func: () {},
          ),
          SizedBox(
            height: 15,
          ),
          TicketPromotion()
        ],
      ),
    );
  }
}
