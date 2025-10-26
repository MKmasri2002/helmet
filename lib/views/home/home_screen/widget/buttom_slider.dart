import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';

class ButtomSlider extends StatelessWidget {
  const ButtomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color(0xff0A6082),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAssets.stopWatch,
              height: 24,
              width: 24,
              colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                nearestOrder?.washTime == null
                    ? "لا يوجد حجز قادم"
                    : (remainingTime == null
                        ? "جاري حساب الوقت..."
                        : remainingTime!.inHours >= 1 ||
                                remainingTime!.inHours < 0
                            ? "الحجز القادم خلال ${remainingTime!.inHours} ساعة"
                            : "الحجز القادم خلال ${remainingTime!.inMinutes} دقيقة"),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  Get.snackbar(
                    'Error',
                    'Please login first',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 3),
                  );
                  return;
                }
                Get.to(
                  () => const OrderStatusView(),
                  binding: OrderStatusBinding(),
                  arguments: nearestOrder, // مرر الطلب الحالي مش أول واحد
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              ),
              child: const Text(
                "عرض",
                style: TextStyle(
                  color: Color(0xff0A6082),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
