import 'package:flutter/material.dart';

void showStatusBottomSheet2(
  BuildContext context, {
  required String mainText,
  required Color color,
  required String imageAsset,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            Text(
              mainText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'IBMPlexSansArabic',
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
