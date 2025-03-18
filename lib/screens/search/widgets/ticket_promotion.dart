import 'package:flightbookapp/core/res/app_media.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketPromotion extends StatelessWidget {
  const TicketPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: size.width * .45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200, blurRadius: 1, spreadRadius: 2)
              ]),
          child: Column(
            children: [
              Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(AppMedia.birthday),
                        fit: BoxFit.cover),
                  )),
              SizedBox(
                height: 12,
              ),
              Text(
                "Mừng sinh nhật 1 năm, giảm ngay 20%. Đừng bỏ lỡ!",
                style: AppTheme.headLineStyle2,
              )
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  width: size.width * .45,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange.shade800,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ưu đãi thành viên mới, đăng kí ngay thôi!",
                        style: AppTheme.headLineStyle2.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sách balo và Flybox ngay thôi!",
                        style: AppTheme.headLineStyle2.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -35,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 18, color: Colors.deepOrange.shade900)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: size.width * 0.44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.pink.shade500),
              child: Column(
                children: [
                  Text(
                    "Đà Lạt gì chưa người đẹp!",
                    style:
                        AppTheme.headLineStyle2.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                      width: 90, height: 90, image: AssetImage(AppMedia.dalat))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
