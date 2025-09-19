import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/models/wash_models/wash_data_trip_model.dart';
import 'package:helmet_customer/theme/app_colors.dart';
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
    required this.currentWasghDataTripModel,
  });
  final WashDataTripModel currentWasghDataTripModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsetsDirectional.only(end: 16),
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
                          ? currentWasghDataTripModel.washTitleAr
                          : currentWasghDataTripModel.washTitleEn,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (currentWasghDataTripModel.washTimeDate != null)
                      CustomText(
                        text:
                            'End date: ${CustomDate.getDateDDMMYYYYFromMillisecond(DateTime.parse(currentWasghDataTripModel.washTimeDate!).millisecondsSinceEpoch)}',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
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
                      text: userWashDataTripModel.isNotEmpty
                          ? '${currentWasghDataTripModel.washCount}'
                          : '0',
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
                washDataTripModel = currentWasghDataTripModel;
                if (currentWasghDataTripModel.washCount! > 1 &&
                    currentWasghDataTripModel.washType! == 'subscription' &&
                    currentWasghDataTripModel.washStatus! == 'pending') {
                  Get.to(
                    () => const BookingView(newOrder: true),
                    binding: BookingBinding(),
                  );
                  return;
                }
                Get.to(
                  () => const OrderStatusView(),
                  binding: OrderStatusBinding(),
                  arguments: washDataTripModel,
                );
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
