import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/app_size.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/cart/cart_controller.dart';
import 'package:helmet_customer/views/cart/widget/payment_method_widget.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
    this.showTime,
    
  });
  final bool? showTime;
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(TranslationData.confirmReservation.tr),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showTime != null)
                  if (showTime!)
                    Container(
                      width: AppSize.width,
                      height: 58,
                      color: AppColors.primary,
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.alarm,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            text: TranslationData
                                .continueTheReservationBeforeTheTimeEnds.tr,
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
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
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
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Helmet',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CustomText(
                          text: TranslationData.reservation.tr,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomText(
                    text: TranslationData.paymentDetails.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: ctrl.product.type,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomText(
text: (ctrl.product.price ?? 0).toStringAsFixed(2),
                            fontSize: 14,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
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
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: TranslationData.tax.tr,
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: (ctrl.product.price! * 0.16).toStringAsFixed(2),
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            SvgAssets.reyal,
                            height: 20,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primary, BlendMode.srcIn),
                          )
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
                      CustomText(
                        text: TranslationData.totalAmmount.tr,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: (ctrl.product.price! + ctrl.product.price! * 0.16)
                                .toStringAsFixed(2),
                            fontSize: 14,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            SvgAssets.reyal,
                            height: 20,
                            width: 16,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primary, BlendMode.srcIn),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                 PaymentMethodWidget()
              ],
            ),
          ),
        );
      },
    );
  }
}
