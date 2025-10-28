import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translate.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/gifts/widget/appbar.dart';
import 'package:helmet_customer/views/gifts/widget/elevatedbutton.dart';
import 'package:helmet_customer/views/gifts/widget/listview.dart';
import 'package:helmet_customer/views/gifts/widget/options.dart';
import 'package:helmet_customer/views/gifts/widget/phonetextfield.dart';

class sendgifts extends StatelessWidget {
  const sendgifts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appbar(
              text:TranslationData.sendGift.tr,
              withleading: true,
              ontap: () => Get.back(),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      TranslationData.recipientPhoneNumber.tr,
                      style:const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                        height: 0.25,
                        letterSpacing: 0,
                        color: Color(0xff121212),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  phonetextfield(controller: ctrl.phoneController),
                  SizedBox(height: 30),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                     TranslationData.chooseYourCard.tr,
                      style:const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        height: 0.25,
                        letterSpacing: 0,
                        color: Color(0xff121212),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  mylistview(i: true, price: "2"),
                  SizedBox(height: 40),
                  OptionButton(
                    title: TranslationData.creditCard.tr,
                    value: 1,
                    controller: ctrl.option1Controller,
                    image2: Assets.visa,
                    image3: Assets.mastercard,
                    image1: Assets.mada,
                  ),
                  SizedBox(height: 8),
                  OptionButton(
                    title: "Stc Pay ",
                    value: 2,
                    controller: ctrl.option1Controller,
                    image1: Assets.stcpay,
                  ),
                  SizedBox(height: 8),
                  OptionButton(
                    title: "Apple Pay",
                    value: 3,
                    controller: ctrl.option1Controller,
                    image1: Assets.applepay,
                  ),
                  SizedBox(height: 20),
                  button(
                      title: TranslationData.confirmAndSend.tr,
                      onPressed: () {
                        ctrl.sendGift(value: "20");
                      }),
                ],
              ),
            ),
            bottomNavigationBar: const CustomNavBar(pos: 3),
        );
      },
    );
  }
}
