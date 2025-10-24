import 'package:flutter/material.dart';

class Mytext extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String? fontFamilyl;

  const Mytext({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 255, 255, 255),
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.fontFamilyl = 'IBM Plex Sans Arabic',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,

      style: TextStyle(
        fontFamily: fontFamilyl,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
