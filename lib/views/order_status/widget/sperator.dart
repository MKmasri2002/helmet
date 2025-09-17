import 'package:flutter/material.dart';

class Sperator extends StatelessWidget {
  const Sperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Divider(
        color: Color(0xffF3F5F4), // لون الخط
        thickness: 2, // سمك الخط
        height: 20, // المسافة العمودية قبل وبعد الخط
      ),
    );
  }
}
