import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/auth/otp/otp_binding.dart';
import 'package:helmet_customer/views/auth/otp/otp_view.dart';
import 'package:helmet_customer/utils/widgets/custom_snake_bar.dart';
import 'package:helmet_customer/widget/my_country_code/country_code_method.dart';

class LoginController extends GetxController {
  String phone = "";
  bool isLoading = false;
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController phoneController = TextEditingController();
  final RegExp onlyNumberFormatter = RegExp(r'^[0-9]+$');
  // Example method to generate a random OTP
  void sendOTP(String phoneNumber) async {
    // remeve zero at the start if exists
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }
    // Check if the phone number is valid
    isLoading = true;
    update();
    if (phoneController.text.isEmpty) {
      // customSnakeBar(message: "Please enter a valid phone number".tr);
      isLoading = false;
      update();
      return;
    }
    log("Sending OTP to: ${mainCountryCode.value.dialCode}${phoneController.text}");
    await auth.verifyPhoneNumber(
      phoneNumber: "${mainCountryCode.value.dialCode}${phoneController.text}",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-resolved, optional

        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        log('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verificationId to use it later when user enters the OTP
        log('Code sent to $phoneNumber');
        log("verificationId : $verificationId");
        log("resend tokent ${resendToken.toString()}");
        Get.back();
        Get.to(
          () => const OtpView(),
          binding: OtpBinding(),
          arguments: {
            "verificationId": verificationId,
            "phone": phoneNumber,
          },
        );
        // Save `verificationId` to use it with the code the user enters
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        log('Auto retrieval timeout');
      },
    );
    // Hide the progress dialog or loading indicator
    //closeProgressDialog();
    isLoading = false;
    update();
  }


}
