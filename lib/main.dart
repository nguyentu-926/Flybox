import 'package:flutter/material.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flightbookapp/core/utils/app_routes.dart';
import 'package:flightbookapp/screens/auth/login_screen.dart';
import 'package:flightbookapp/screens/auth/signup_screen.dart';
import 'package:flightbookapp/screens/home/all_hotels_screen.dart';
import 'package:flightbookapp/screens/home/all_tickets_screen.dart';
import 'package:flightbookapp/screens/hotel/hotel_details_screen.dart';
import 'package:flightbookapp/screens/ticket/ticket_screen.dart';
import 'package:flightbookapp/screens/profile/profile_screen.dart';
import 'package:flightbookapp/core/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlightBook',
      theme: ThemeData(
        primaryColor: primary,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen, // Khi khởi động sẽ vào trang Đăng nhập
      routes: {
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.signupScreen: (context) => SignupScreen(),
        AppRoutes.homeScreen: (context) => const BottomNavBar(),
        AppRoutes.allTicketsScreen: (context) => const AllTicketsScreen(),
        AppRoutes.ticketScreen: (context) => const TicketScreen(),
        AppRoutes.allHotelsScreen: (context) => const AllHotelsScreen(),
        AppRoutes.hotelDetailsScreen: (context) => const HotelDetailsScreen(),
      },
    );
  }
}
