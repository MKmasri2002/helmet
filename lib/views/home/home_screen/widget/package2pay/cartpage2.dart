import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/cart/cart_controller.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/views/home/home_screen/widget/package2pay/pay_with_cridet_cart2.dart';

class SubscriptionCartScreen extends StatelessWidget {
  final Subscribe subscription;
  final bool? showTime;

  const SubscriptionCartScreen({
    super.key,
    required this.subscription,
    this.showTime,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (ctrl) {
        double price = subscription.price?.toDouble() ?? 0;
        double tax = price * 0.16;
        double total = price + tax;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Confirm Subscription"),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showTime != null && showTime!)
                  Container(
                    width: AppSize.width,
                    height: 58,
                    color: AppColors.primary,
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        const Icon(Icons.alarm, color: Colors.white),
                        const SizedBox(width: 10),
                        CustomText(
                          text: "Continue before time ends",
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        Text(
                          ctrl.formatTime(ctrl.seconds),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.crown,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: subscription.titleEn ??
                              subscription.titleAr ??
                              "Subscription",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 4),
                        const CustomText(
                          text: "Subscription Details",
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomText(
                    text: "Payment Details",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price:"),
                      Row(
                        children: [
                          Text(price.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 14, color: AppColors.primary)),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            SvgAssets.reyal,
                            height: 20,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primary, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tax (16%):"),
                      Row(
                        children: [
                          Text(tax.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 14, color: AppColors.primary)),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            SvgAssets.reyal,
                            height: 20,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primary, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total:"),
                      Row(
                        children: [
                          Text(total.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 14, color: AppColors.primary)),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            SvgAssets.reyal,
                            height: 20,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primary, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // تمرير السعر النهائي مع الضريبة لصفحة الدفع
                PayWithCreditCard2(total: total),
              ],
            ),
          ),
        );
      },
    );
  }
}
