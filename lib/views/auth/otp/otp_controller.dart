import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class OtpController extends GetxController {
  var data = Get.arguments;
  final GlobalKey<FormState> otpForm = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String phone = '';
  String verificationId = '';
  RxInt start = 30.obs;
  RxInt oldStart = 30.obs;
  RxInt counter = 4.obs;
  RxInt otpCounter = 0.obs;
  Rx<Timer> timer = Timer(const Duration(seconds: 30), () {}).obs;

  @override
  void onInit() {
    log("on init");
    verificationId = Get.arguments["verificationId"];
    phone = Get.arguments["phone"];
    log("phonex : $verificationId");
    log("phone : $phone");
    startTimer();
    super.onInit();
  }

  void startTimer() {
    const Duration oneSec = Duration(seconds: 1);
    timer.value = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  // This class is responsible for handling OTP (One Time Password) related operations.
  // It can include methods for generating, validating, and sending OTPs.
  FirebaseAuth auth = FirebaseAuth.instance;
  // // Example method to generate a random OTP
  // void sendOTP(String phoneNumber) async {
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // Auto-resolved, optional
  //       await auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print('Verification failed: ${e.message}');
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       // Store the verificationId to use it later when user enters the OTP
  //       print('Code sent to $phoneNumber');
  //       // Save `verificationId` to use it with the code the user enters
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       print('Auto retrieval timeout');
  //     },
  //   );
  // }

  void verifyOTP(String smsCode) async {
    log("sms code : $smsCode");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    DatabaseReference collectionReference =
        FirebaseDatabase.instance.ref("Users/${userCredential.user!.uid}");
    // Check if the user already exists in Firestore
    DataSnapshot snapshot = await collectionReference.get();

    if (snapshot.exists) {
      // get data and save it in user model
      Map<String, dynamic> data = jsonDecode(jsonEncode(snapshot.value));
      userModel = UserModel.fromJson(data);
      // User already exists, handle accordingly
      log('User already exists');
      Get.offAllNamed(RoutesString.home);
      return;
    }
    userModel.phone = phone;
    userModel.uid = FirebaseAuth.instance.currentUser!.uid;
    userModel.registerDate = DateTime.now().toString();
    userModel.lastLoginDate = DateTime.now().millisecondsSinceEpoch;
    userModel.referralCode = FirebaseAuth.instance.currentUser!.uid;
    userModel.userType = "1";
    userModel.coins = 0;
    collectionReference.set(userModel.toJson());
    log(userModel.toJson().toString());
    // Get.toNamed(RoutesString.home);
    Get.offAllNamed(RoutesString.home);
  }
  // Additional methods and properties can be added as needed.
}
