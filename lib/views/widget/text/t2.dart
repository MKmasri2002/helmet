import 'package:flutter/material.dart';

class T2 extends StatelessWidget {
  final String text;
  const T2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(0xff8193B3),
          fontSize: 14,
          height: 1.4),
    );
  }
}
