import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/theme/text_themes.dart';
import 'package:helmet_customer/utils/exptions.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/auth/otp/otp_controller.dart';
import 'package:helmet_customer/widget/otp/pin_code_fields.dart';
import 'package:helmet_customer/widget/primary_appbar.dart';
import 'package:helmet_customer/widget/progress_button/progress_button.dart';
import 'package:helmet_customer/widget/text/headline1.dart';
import 'package:helmet_customer/widget/text/headline5.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appTools.unFocusKeyboard(context),
      child: Scaffold(
        appBar: const PrimaryAppBar(
          withBack: true,
        ),
        body: Form(
          key: controller.otpForm,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Headline1(
                    title: TranslationData.verifyYourPhoneNumber.tr,
                    style: TextThemeStyle().headline5.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Headline5(
                    // title: 'Create your account',
                    title: "${TranslationData
                            .pleaseEnterTheVerificationCodeSentTo.tr}\n05xxxxxxxxx",
                    style: TextThemeStyle().headline5.copyWith(
                          color: const Color.fromARGB(255, 118, 118, 120),
                        ),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PinCodeTextField(
                    length: 6,
                    appContext: context,
                    controller: controller.otpController,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60,
                      fieldWidth: 60,
                      borderWidth: 1.5,
                      borderRadius: BorderRadius.circular(4),
                      selectedColor: Colors.red.withValues(alpha: 0),
                      selectedFillColor: Colors.grey.withValues(alpha: 0.2),
                      inactiveFillColor: Colors.grey.withValues(alpha: 0.2),
                      inactiveColor: Colors.grey.withValues(alpha: 0),
                      activeColor: Colors.grey.withValues(alpha: 0),
                      activeFillColor: Colors.grey.withValues(alpha: 0.2),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged: (String value) {},
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(RegExption.onlyNumber),
                      ),
                    ],
                    beforeTextPaste: (String? text) => true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ProgressButton(
                    borderRadius: BorderRadius.circular(8),
                    title: TranslationData.verify.tr,
                    color: AppColors.primary,
                    onPressed: (AnimationController animationController) async {
                      animationController.forward();
                      await Future.delayed(const Duration(seconds: 3));
                      animationController.reverse();
                      controller.verifyOTP(
                        controller.otpController.text,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  InkWell(
                    onTap: () async {
                      if (controller.counter.value == 0 &&
                          controller.start.value == 0) {
                        // appTools.warningUser(
                        //   'otpError',
                        // );
                      }
                      if (controller.start.value == 0 &&
                          controller.counter.value > 0) {
                        controller.counter.value -= 1;
                        controller.start.value = controller.oldStart.value * 2;
                        controller.oldStart.value = controller.start.value;
                        controller.timer.value.cancel();
                        controller.startTimer();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Headline5(
                          title: TranslationData.resendCodeAfter.tr,
                          style: TextThemeStyle().headline5.copyWith(
                                color: AppColors.black.withValues(alpha: 0.6),
                              ),
                        ),
                        // Headline5(
                        //   title: AppTools.timeFormatter(
                        //       controller.start.value.toDouble()),
                        //   style: TextThemeStyle().headline5.copyWith(
                        //         fontWeight: FontWeight.w700,
                        //       ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
