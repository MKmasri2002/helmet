import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component6 extends StatelessWidget {
  const Component6({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("تفاصيل الحجز"),
      );
    });
  }
}
