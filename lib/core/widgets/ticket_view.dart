import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flightbookapp/core/widgets/app_column_text_layout.dart';
import 'package:flightbookapp/core/widgets/app_layout_builder.dart';
import 'package:flightbookapp/core/widgets/circle_half.dart';
import 'package:flightbookapp/core/widgets/flight_circle.dart';
import 'package:flightbookapp/core/widgets/styled_text_headline_four.dart';
import 'package:flightbookapp/core/widgets/styled_text_headline_three.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool isDefault;
  final Color primaryColor;
  final Color secondaryColor;
  final Color designColor;
  final Color circleColor;
  final bool? styleTwo;

  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isDefault = true,
      this.primaryColor = Colors.white,
      this.designColor = Colors.white,
      this.secondaryColor = Colors.white,
      this.circleColor = AppTheme.bgColor,
      this.styleTwo});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 360,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 15),
        child: Column(
          children: [
            // Ticket top section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: isDefault == true
                      ? Colors.white
                      : AppTheme.ticketTopColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19))),
              child: Column(
                children: [
                  // destinations with codes
                  Row(
                    children: [
                      StyledTextHeadlineThree(
                        text: ticket["from"]["code"],
                        color: primaryColor,
                      ),
                      Spacer(),
                      FlightCircle(
                        color: designColor,
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilder(
                              randomDivider: 6,
                              color: designColor,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: -4.8,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: designColor,
                              ),
                            ),
                          )
                        ],
                      )),
                      FlightCircle(
                        color: designColor,
                      ),
                      Spacer(),
                      StyledTextHeadlineThree(
                        text: ticket["to"]["code"],
                        color: primaryColor,
                      )
                    ],
                  ),

                  SizedBox(
                    height: 3,
                  ),
                  // destinations names and time
                  Row(
                    children: [
                      SizedBox(
                          width: 100,
                          child: StyledTextHeadlineFour(
                            text: ticket["from"]["name"],
                            color: secondaryColor,
                          )),
                      Expanded(child: Container()),
                      StyledTextHeadlineFour(
                        text: ticket["flying_time"],
                        color: secondaryColor,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: StyledTextHeadlineFour(
                          text: ticket["to"]["name"],
                          color: secondaryColor,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Ticket middle section
            Container(
              color: AppTheme.ticketBottomColor,
              child: Row(
                children: [
                  CircleHalf(isRight: false, color: circleColor),
                  Expanded(
                      child: AppLayoutBuilder(
                    randomDivider: 12,
                    width: 4,
                    color: AppTheme.bgColor,
                  )
                  ),
                  CircleHalf(
                    isRight: true,
                    color: circleColor,
                  ),
                ],
              ),
            ),
            // Ticket bottom section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppTheme.ticketBottomColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: styleTwo == true
                          ? Radius.circular(0)
                          : Radius.circular(19),
                      bottomRight: styleTwo == true
                          ? Radius.circular(0)
                          : Radius.circular(19))),
              child: Column(
                children: [
                  // destinations with codes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        topText: ticket["date"],
                        bottomText: "Date",
                        color: secondaryColor,
                        styleTwo: styleTwo,
                      ),
                      AppColumnTextLayout(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        topText: ticket["departure_time"],
                        bottomText: "Departure time",
                        color: secondaryColor,
                        styleTwo: styleTwo,
                      ),
                      AppColumnTextLayout(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        topText: ticket["number"].toString(),
                        bottomText: "Number",
                        color: secondaryColor,
                        styleTwo: styleTwo,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
