import 'package:barcode_widget/barcode_widget.dart';
import 'package:flightbookapp/core/data/tickets_data.dart';
import 'package:flightbookapp/core/res/app_media.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flightbookapp/core/widgets/app_column_text_layout.dart';
import 'package:flightbookapp/core/widgets/app_layout_builder.dart';
import 'package:flightbookapp/core/widgets/styled_text_headline_four.dart';
import 'package:flightbookapp/core/widgets/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  List<Map<String, dynamic>> cartTickets =
      List.from(ticketList); // Danh sách vé trong giỏ hàng

  void removeTicket(int index) {
    setState(() {
      cartTickets.removeAt(index); // Xóa vé khỏi giỏ hàng
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      appBar: AppBar(
        title: Text("Giỏ hàng", style: AppTheme.headLineStyle1),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: cartTickets.isEmpty
          ? Center(
              child: Text(
                "Giỏ hàng của bạn trống!",
                style: AppTheme.headLineStyle2,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              itemCount: cartTickets.length,
              itemBuilder: (context, index) {
                final ticket = cartTickets[index];
                return Column(
                  children: [
                    TicketView(
                      ticket: ticket,
                      wholeScreen: true,
                      primaryColor: Colors.black,
                      secondaryColor: Colors.grey.shade700,
                      designColor: Colors.lightBlue.shade200,
                      circleColor: Colors.white,
                      styleTwo: true,
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 360,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mã đặt chỗ: ${ticket['number']}",
                            style: AppTheme.headLineStyle3
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                topText: ticket['from']['name'],
                                bottomText: "Điểm đi",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                topText: ticket['to']['name'],
                                bottomText: "Điểm đến",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.center,
                            child: BarcodeWidget(
                              height: 70,
                              data: "Vé số: ${ticket['number']}",
                              barcode: Barcode.qrCode(),
                            ),
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: ElevatedButton(
                              onPressed: () => removeTicket(index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: Text("Xóa vé",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                );
              },
            ),
    );
  }
}
