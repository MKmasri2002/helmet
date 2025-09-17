import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component3 extends StatelessWidget {
  const Component3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "وقت الموعد",
              textAlign: TextAlign.start,
              style: const TextStyle(
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "(من الممكن وصول البايكر 15 دقيقة قبل او بعد الوقت المحدد)",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      );
    });
  }
}
