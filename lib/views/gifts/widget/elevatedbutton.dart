import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
    final Color? textcolor;


  const button({super.key, required this.title, this.onPressed,this.backgroundColor,this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor:backgroundColor ?? const Color.fromARGB(255, 74, 197, 237),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                height: 0.25,
                letterSpacing: 0,
                color: textcolor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
