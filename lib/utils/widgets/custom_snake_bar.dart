import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnakeBar(
    {String title = "System...",
    required String message,
    Color color = Colors.indigoAccent}) {
  if (color == Colors.indigoAccent) {
    color = Colors.red;
  }
  title = title.replaceAll("\n", " ");
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.snackbar(
      title,
      message,
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'IBMPlexSansArabic',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      colorText: Colors.white,
      padding: const EdgeInsets.all(10),
      borderRadius: 20,
      backgroundColor: color,
      snackPosition: SnackPosition.BOTTOM,
    );
  });
}
