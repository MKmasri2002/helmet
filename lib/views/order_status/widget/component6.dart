import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component6 extends StatelessWidget {
  const Component6({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "تفاصيل الحجز",
          style: TextStyle(
            fontFamily: 'IBMPlexSansArabic',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 25 / 16,
            letterSpacing: 0,
            color: Color(0xff121212),
          ),
          textAlign: TextAlign.start,
        ),
      );
    });
  }
}
