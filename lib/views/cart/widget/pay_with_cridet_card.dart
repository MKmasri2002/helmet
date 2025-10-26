import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/cart/cart_controller.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:moyasar/moyasar.dart';

class PayWithCreditCard extends StatelessWidget {
  const PayWithCreditCard({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (ctrl) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Pay With Credit Card',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 16,
                ),
                CreditCard(
                  config: PaymentMethods.payWithMoyasarCridetCard(
                      (ctrl.product.price! + ctrl.product.price! * 0.16)),
                  onPaymentResult: ctrl.onPaymentResult,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
