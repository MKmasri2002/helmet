import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';
import 'package:helmet_customer/views/booking/booking_view/widget/pay_with_cridet_card_booking.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';
import 'package:moyasar/moyasar.dart';

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (ctrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Payment Method',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
              if (Platform.isIOS)
                ListTile(
                  leading: const Icon(Icons.apple, size: 30),
                  title: const CustomText(
                    text: 'Pay With Apple Pay',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  trailing: Checkbox(
                    value: ctrl.applePay,
                    onChanged: (value) {},
                  ),
                  onTap: () {
                    ctrl.applePay = true;
                    ctrl.creditCard = false;
                    ctrl.update();
                  },
                ),
              ListTile(
                leading: const Icon(Icons.credit_card, size: 30),
                title: const CustomText(
                  text: 'Pay With Credit Card',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                trailing: Checkbox(
                  value: ctrl.creditCard,
                  onChanged: (value) {},
                ),
                onTap: () {
                  ctrl.applePay = false;
                  ctrl.creditCard = true;
                  ctrl.update();
                },
              ),
              const SizedBox(height: 16),
              if (ctrl.creditCard)
                PrimaryButton(
                    onTap: () {
                      if (ctrl.creditCard) {
                        appTools.showCustomBottomSheet(
                            context, const PayWithCreditCardBooking(), true);
                        return;
                      }
                    },
                    title: 'Pay Now'),
              if (ctrl.applePay && Platform.isIOS)
                // ApplePay(
                //     config: PaymentMethods.payWithMoyasarApplePay(
                //         (washDataTripModel.washPrice! +
                //             washDataTripModel.washPrice! * 0.16)),
                //     onPaymentResult: ctrl.onPaymentResult),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}
