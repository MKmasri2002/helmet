import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.onTap,
      this.width = double.infinity,
      this.height = 50,
      this.circular = 10,
      this.fontSize = 14,
      required this.color,
      this.textColor = Colors.white,
      required this.text,
      this.fontWeight = FontWeight.normal});

  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? circular;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final String? text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circular!),
        ),
        child: Center(
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBMPlexSansArabic',
              color: textColor ?? Colors.white,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
