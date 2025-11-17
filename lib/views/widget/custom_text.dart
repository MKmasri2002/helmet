import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    this.text = "",
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.color = Colors.black,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
