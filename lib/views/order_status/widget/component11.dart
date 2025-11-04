import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component11 extends StatelessWidget {
  const Component11({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15), // مسافة من كل الجهات
        width: double.infinity, // عرض الشاشة كامل
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ctrl.currentOrder!.status == "finsh"
                ? const Color(0xff29C1F2)
                : const Color(0xff29C1F2).withAlpha(127), // لون الزر
            foregroundColor: Colors.white, // لون الخط والأيقونات
            padding: const EdgeInsets.symmetric(vertical: 16), // ارتفاع الزر
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // زوايا ناعمة
            ),
          ),
          onPressed: ctrl.currentOrder!.status == "finsh"
              ? () {
                  ctrl.updateOrderStatus("done");
                  Get.toNamed(RoutesString.feedback);
                }
              : null,
          child: const Text(
            "تأكيد نهاية الطلب",
            style: TextStyle(
              fontFamily: 'IBMPlexSansArabic',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
              letterSpacing: 0,
              color: Color(0xffffffff),
            ),
          ),
        ),
      );
    });
  }
}
