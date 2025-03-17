import 'package:barcode_widget/barcode_widget.dart';
import 'package:flightbookapp/core/data/tickets_data.dart';
import 'package:flightbookapp/core/res/app_media.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flightbookapp/core/widgets/app_column_text_layout.dart';
import 'package:flightbookapp/core/widgets/app_layout_builder.dart';
import 'package:flightbookapp/core/widgets/styled_text_headline_four.dart';
import 'package:flightbookapp/core/widgets/ticket_view.dart';
import 'package:flightbookapp/screens/search/widgets/tickets_tabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Tickets",
                style: AppTheme.headLineStyle1,
              ),
              SizedBox(
                height: 20,
              ),
              TicketsTabs(
                firstTab: "Upcoming",
                secondTab: "Previous",
              ),
              SizedBox(
                height: 20,
              ),
              // flight details ticket
              Container(
                child: Column(
                  children: [
                    TicketView(
                      ticket: ticketList[ticketIndex],
                      wholeScreen: true,
                      primaryColor: Colors.black,
                      secondaryColor: Colors.grey.shade700,
                      designColor: Colors.lightBlue.shade200,
                      circleColor: Colors.white,
                      styleTwo: true,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      width: 360,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                topText: "Mr ABDELILLAH",
                                bottomText: "Passenger",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                topText: "785083421",
                                bottomText: "Passport N°",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: AppLayoutBuilder(
                              randomDivider: 12,
                              width: 4,
                              color: AppTheme.bgColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                topText: "232324 4534235253656",
                                bottomText: "E-Ticket N°",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                topText: "34GF35DS",
                                bottomText: "Booking code",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: AppLayoutBuilder(
                              randomDivider: 12,
                              width: 4,
                              color: AppTheme.bgColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AppMedia.mastercard,
                                        scale: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "**** 4158",
                                        style: AppTheme.headLineStyle3.copyWith(
                                            fontFamily:
                                                GoogleFonts.afacad().fontFamily,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                  StyledTextHeadlineFour(
                                    text: "Payment method",
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                              AppColumnTextLayout(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                topText: "€248.68",
                                bottomText: "Price",
                                color: Colors.grey.shade700,
                                styleTwo: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    // barcode section
                    Container(
                      width: 360,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(21),
                              bottomLeft: Radius.circular(21))),
                      child: Container(
                        child: ClipRRect(
                          child: BarcodeWidget(
                              height: 80,
                              data:
                                  "FULL NAME : MR FULL NAME | PASSPORT : 568495784",
                              drawText: false,
                              barcode: Barcode.qrCode()),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  wholeScreen: true,
                  isDefault: false,
                ),
              )
            ],
          ),
          Positioned(
              left: 15,
              top: 400,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(width: 2)),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Colors.black,
                ),
              )),
          Positioned(
              right: 15,
              top: 400,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(width: 2)),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}
