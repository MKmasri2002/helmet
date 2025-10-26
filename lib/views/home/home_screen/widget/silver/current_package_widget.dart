import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/custom_date.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/booking/booking_binding.dart';
import 'package:helmet_customer/views/booking/booking_view/booking_view.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_binding.dart';
import 'package:helmet_customer/views/order_status/order_status_view.dart';

class CurrentPackageWidget extends StatelessWidget {
  const CurrentPackageWidget({
    super.key,
    required this.currentOrder,
  });
  final Subscribe currentOrder;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: AppSize.width,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: Get.locale!.languageCode == 'ar'
                          ? currentOrder.titleAr
                          : currentOrder.titleEn,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // if (currentOrder.endDate != null)
                    //   CustomText(
                    //     text:
                    //         'End date: ${CustomDate.getDateDDMMYYYYFromMillisecond(DateTime.parse(currentOrder.endDate!).millisecondsSinceEpoch)}',
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w700,
                    //     color: Colors.grey,
                    //   ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 80,
                  width: 1,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    const CustomText(
                      text: 'Remain',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: currentOrder.count.toString(),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  Get.snackbar('Error', 'Please login first',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 3));
                  return;
                }
                //  washDataTripModel = currentOrder;

                if (currentOrder.remain! > 0) {
                  Get.to(
                    () => const BookingView(newOrder: true),
                    binding: BookingBinding(),
                  );
                  return;
                }
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: TranslationData.usePackage.tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primary,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
