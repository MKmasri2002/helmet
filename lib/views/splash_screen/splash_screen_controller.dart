import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/data/user_repository.dart';
import 'package:helmet_customer/main.dart';
import 'package:helmet_customer/models/address/addresses.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/notificatio_manager.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  late VideoPlayerController videoController;
  bool videoInitialized = false;

  @override
  void onInit() async {
    super.onInit();
    videoController =
        VideoPlayerController.asset('assets/video/splash_vid.mp4');
    await videoController.initialize();
    videoController.setLooping(true);
    videoController.setVolume(0.0); // Mute video on start
    videoController.play();
    videoInitialized = true;
    update();
    //FirebaseAuth.instance.signOut();
    await checkConnectivity();
    await getCurrentPosition();
    
    try {
      userModel.token = await FirebaseMessaging.instance.getToken() ?? "";
    } catch (e) {
      log('Error getting FCM token: $e');
    }
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }

  Future<void> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

// This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.

    if (!connectivityResult.contains(ConnectivityResult.mobile) &&
        !connectivityResult.contains(ConnectivityResult.wifi)) {
      // Mobile network available.
      Get.snackbar('No Internet Connection',
          'Please check your internet connection and try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3));
      return;
    }
    //await FirebaseMessaging.instance.requestPermission();
    NotificationManagement.onGroundMessaging();
    NotificationManagement.open();
    NotificationManagement.firebaseMessagingBackgroundHandler;
    try {
      token = await FirebaseMessaging.instance.getToken();
      log('✅ FCM Token: $token');
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
    await Future.delayed(const Duration(seconds: 3));
    if (FirebaseAuth.instance.currentUser != null) {
      // await UserRepository.(
      //     userId: FirebaseAuth.instance.currentUser!.uid);
      Get.offAllNamed(RoutesString.home);
      return;
    }
    Get.offAllNamed(RoutesString.login);
  }

  Future<void> getCurrentPosition() async {
    // Check if the user has granted location permission
    // If not, request permission
    await Permission.location.request();
    await Geolocator.requestPermission();
    // Check the status of the permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission.name == 'whileInUse') {
      log('Permission granted');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentAddress.value = AddressModel(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      currentAddress.update((value) => AddressModel(
            latitude: position.latitude,
            longitude: position.longitude,
          ));
      log('Current position: ${position.latitude}, ${position.longitude}');
    } else if (permission.name == 'denied') {
      log('Permission denied');
      // Open app settings to allow the user to enable location permission
      await Permission.location.request();
    }
  }
}
