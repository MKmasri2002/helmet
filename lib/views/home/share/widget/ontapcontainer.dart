import 'package:flutter/material.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/home/share/widget/mytext.dart';

class OntapContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String icon;
  final VoidCallback? onTap;

  const OntapContainer({
    super.key,
    required this.text1,
    required this.text2,
   required this.icon ,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ImageIcon(AssetImage(icon), color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Mytext(
                  text: text1,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0A3347),
                ),
                const SizedBox(height: 7),
                Mytext(text: text2, fontSize: 15, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
