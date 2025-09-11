import 'package:flutter/material.dart';
import 'package:helmet_customer/theme/text_themes.dart';

class Headline4 extends StatelessWidget {
  const Headline4({
    super.key,
    required this.title,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textDecoration,
    this.color,
    this.fontSize,
  });
  final String title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) => Text(
        title,
        style: style ??
            TextThemeStyle().headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color ?? Colors.black,
                  fontSize: fontSize ?? 20,
                ),
        maxLines: maxLines ?? 1,
        overflow: overflow ?? TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.start,
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Container(
        color: Colors.black,
        child: const Text(
          "Majed Hatem",
          style: TextStyle(
            color: Color.fromARGB(255, 91, 185, 96),
            fontSize: 38.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
