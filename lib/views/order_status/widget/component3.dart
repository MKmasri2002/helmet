import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component3 extends StatelessWidget {
  const Component3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "وقت الموعد",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 25 / 16,
                letterSpacing: 0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "20-60 دقيقة",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 25 / 20,
                letterSpacing: 0,
                color: Color(0xff29C1F2),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "(من الممكن وصول البايكر 15 دقيقة قبل او بعد الوقت المحدد)",
              style: TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 25 / 12,
                letterSpacing: 0,
                color: Color(0xff8193B3),
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      );
    });
  }
}
