import 'package:flutter/material.dart';
import 'package:helmet_customer/theme/app_colors.dart';

class T1 extends StatelessWidget {
  final String text;
  const T1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'IBMPlexSansArabic',
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          fontSize: 20,
          height: 1.5),
    );
  }
}
