import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:http/http.dart' as http;

class NotificationManagement {
  static void onGroundMessaging() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.data.isNotEmpty) {
          Get.put(() => HomeController());
          Get.put(() => OrderStatusController());
          Get.find<OrderStatusController>().getOrderById();
        }
        Get.snackbar(
          message.notification?.title ?? "Notification",
          message.notification?.body ?? "You have a new notification",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.white,
        );
      },
    );
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static void open() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }

  static void sendNotification(String token, Map<String, dynamic> data,
      Map<String, dynamic> notification) async {
    // 1. تحميل ملف حساب الخدمة
    final serviceAccountJson =
        await rootBundle.loadString('assets/json/ss.json');
    final serviceAccount =
        ServiceAccountCredentials.fromJson(jsonDecode(serviceAccountJson));

    // 2. تحديد الصلاحيات المطلوبة (scopes)
    const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    // 3. إنشاء عميل مصادق عليه
    final client = await clientViaServiceAccount(serviceAccount, scopes);

    // 4. جلب التوكن
    final accessToken = client.credentials.accessToken.data;

    // print('✅ Access Token: $accessToken');

    // 5. إرسال إشعار (اختياري)
    const fcmUrl =
        'https://fcm.googleapis.com/v1/projects/helmet-dac17/messages:send';

    final message = {
      "message": {"notification": notification, "data": data, "token": token}
    };

    await http.post(
      Uri.parse(fcmUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(message),
    );

    client.close();
  }
}
