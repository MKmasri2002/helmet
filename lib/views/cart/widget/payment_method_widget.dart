import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/cart/cart_controller.dart';
import 'package:helmet_customer/views/cart/widget/pay_with_cridet_card.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';
import 'package:moyasar/moyasar.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (ctrl) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: TranslationData.paymentMethod.tr,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 16,
              ),
              if (!Platform.isAndroid)
                InkWell(
                  onTap: () {
                    ctrl.applePay = !ctrl.applePay;
                    ctrl.creditCard = false;
                    ctrl.update();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.apple_sharp),
                      const SizedBox(
                        width: 16,
                      ),
                      CustomText(
                        text: TranslationData.payWithApplePay.tr,
                        fontSize: 16,
                      ),
                      const Spacer(),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color:
                              ctrl.applePay ? AppColors.primary : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  
                  ctrl.applePay = false;
                  ctrl.creditCard = !ctrl.creditCard;
                  ctrl.update();
                },
                child: Row(
                  children: [
                    const Icon(Icons.credit_card),
                    const SizedBox(
                      width: 16,
                    ),
                    CustomText(
                      text: TranslationData.payWithCreditCard.tr,
                      fontSize: 16,
                    ),
                    const Spacer(),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color:
                            ctrl.creditCard ? AppColors.primary : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              if (ctrl.creditCard)
                PrimaryButton(
                  onTap: () {
                    if (ctrl.seconds <= 0) {
                      Get.snackbar(
                        TranslationData.error.tr,
                        TranslationData.timeExpired.tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    appTools.showCustomBottomSheet(
                        context, const PayWithCreditCard(), true);
                  },
                  title: 'Confirm',
                ),
              // if (ctrl.applePay && Platform.isAndroid)
                // ApplePay(
                //     config: PaymentMethods.payWithMoyasarApplePay(
                //         (washDataTripModel.washPrice! +
                //             washDataTripModel.washPrice! * 0.16)),
                //     onPaymentResult: ctrl.onPaymentResult)
            ],
          ),
        );
      },
    );
  }
}
