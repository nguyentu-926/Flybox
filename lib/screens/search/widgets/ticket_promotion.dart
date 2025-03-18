import 'package:flightbookapp/core/res/app_media.dart';
import 'package:flightbookapp/core/res/styles/app_theme.dart';
import 'package:flutter/material.dart';

class TicketPromotion extends StatelessWidget {
  const TicketPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPromoCard(
          size,
          image: AppMedia.birthday,
          text: "Mừng sinh nhật 1 năm, giảm ngay 20%. Đừng bỏ lỡ!",
          onTap: () {
            print("Nhấn vào ưu đãi sinh nhật!");
          },
        ),
        Column(
          children: [
            _buildPromoCard(
              size,
              text: "Ưu đãi thành viên mới, đăng kí ngay thôi!",
              subText: "Sách balo và Flybox ngay thôi!",
              color: Colors.deepOrange.shade800,
              borderColor: Colors.deepOrange.shade900,
              isStacked: true,
              onTap: () {
                print("Nhấn vào ưu đãi thành viên mới!");
              },
            ),
            SizedBox(height: 10),
            _buildPromoCard(
              size,
              text: "Đà Lạt gì chưa người đẹp!",
              image: AppMedia.dalat,
              color: Colors.pink.shade500,
              onTap: () {
                print("Nhấn vào ưu đãi Đà Lạt!");
              },
            ),
          ],
        )
      ],
    );
  }

  /// Widget tạo thẻ khuyến mãi
  Widget _buildPromoCard(
    Size size, {
    String? image,
    required String text,
    String? subText,
    Color color = Colors.white,
    Color? borderColor,
    bool isStacked = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: size.width * .45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 3,
              spreadRadius: 2,
            )
          ],
          border: borderColor != null
              ? Border.all(color: borderColor, width: 2)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (isStacked)
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: AppTheme.headLineStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        if (subText != null)
                          Text(
                            subText,
                            style: AppTheme.headLineStyle2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18,
                            ),
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
                        border: Border.all(width: 18, color: borderColor!),
                      ),
                    ),
                  )
                ],
              )
            else
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  text,
                  style: AppTheme.headLineStyle2.copyWith(
                    color: color == Colors.white ? Colors.black : Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
