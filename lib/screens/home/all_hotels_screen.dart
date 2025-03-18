import 'package:flightbookapp/core/data/hotels_list.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flightbookapp/screens/home/widgets/grid_hotel_card.dart';
import 'package:flutter/material.dart';

class AllHotelsScreen extends StatelessWidget {
  const AllHotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      appBar: AppBar(
        title: const Text("All Hotels"),
        backgroundColor: AppTheme.bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 14.0,
            childAspectRatio: 0.8, // Tăng chiều cao thẻ
          ),
          itemCount: hotelsList.length,
          itemBuilder: (context, index) {
            return GridHotelCard(hotel: hotelsList[index], index: index);
          },
        ),
      ),
    );
  }
}
