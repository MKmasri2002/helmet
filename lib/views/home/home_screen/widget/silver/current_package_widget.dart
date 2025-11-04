import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/custom_date.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/share_packages/share_package_screen.dart';
import 'package:helmet_customer/views/share_packages/share_package_binding.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/booking/booking_binding.dart';
import 'package:helmet_customer/views/booking/booking_view/booking_view.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
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
                    const SizedBox(height: 8),
                    if (currentOrder.endDate != null)
                      CustomText(
                        text:
                            '${TranslationData.endDate.tr} ${CustomDate.getDateDDMMYYYYFromMillisecond(DateTime.parse(currentOrder.endDate!).millisecondsSinceEpoch)}',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    const SizedBox(height: 8),

                    /// زر الشير بعد التعديل فقط 👇👇
                    GestureDetector(
                      onTap: () {
                        if (ctrl.checkLogin() == false) {
                          ctrl.pleaseLogin();
                          return;
                        }
                        if (ctrl.checkLocation() == false) {
                          ctrl.pleaseSelectLocation();
                          return;
                        }

                        Get.toNamed(RoutesString.sharePackage,
                            arguments: {'packageId': currentOrder.id});
                      },
                      child: Container(
                        width: AppSize.width * 0.35,
                        height: AppSize.width * 0.13,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color(0xff29C1F2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TranslationData.sharePackage.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'IBMPlexSansArabic',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              SvgAssets.sharePackage,
                              width: 22.21,
                              height: 23.29,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 80,
                  width: 1,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    CustomText(
                      text: TranslationData.remain.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: currentOrder.remain.toString(),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    CustomText(
                      text: '${TranslationData.outOf.tr} ${currentOrder.count}',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
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

                order = OrderModel(
                  areaId: userModel.addresses
                      .firstWhere(
                        (addr) => addr.defaultLocation == true,
                        orElse: () => userModel.addresses.first,
                      )
                      .areaId,
                  user_id: userModel.uid,
                  status: 'pending',
                  price: currentOrder.price,
                  titleAr: currentOrder.titleAr,
                  titleEn: currentOrder.titleEn,
                  type: currentOrder.type,
                );

                if (currentOrder.remain! > 0) {
                  Get.to(
                    () => const BookingView(newOrder: true),
                    binding: BookingBinding(),
                    arguments: {'product': currentOrder},
                  );
                  return;
                }
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF0FAFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: TranslationData.usePackage.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
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
