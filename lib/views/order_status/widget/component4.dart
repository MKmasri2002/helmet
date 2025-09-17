import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component4 extends StatelessWidget {
  const Component4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              "رقم الحجز  1238764",
              style: TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 25 / 18,
                letterSpacing: 0,
                color: Color(0xff121212),
              ),
              textAlign: TextAlign.start,
            ),
            const Icon(
              Icons.copy,
              color: Color(0xff8193B3),
            ),
            SizedBox(
              width: AppSize.width * 0.3,
            ),
          ],
        ),
      );
    });
  }
}
