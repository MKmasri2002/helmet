import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component11 extends StatelessWidget {
  const Component11({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: const EdgeInsets.all(8), // مسافة من كل الجهات
        width: double.infinity, // عرض الشاشة كامل
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // لون الزر
            foregroundColor: Colors.white, // لون الخط والأيقونات
            padding: const EdgeInsets.symmetric(vertical: 16), // ارتفاع الزر
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // زوايا ناعمة
            ),
          ),
          onPressed: () {
            // أكشن الزر
          },
          child: const Text(
            "تأكيد نهاية الطلب",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
