import 'package:flutter/material.dart';

class DeleteAccountText extends StatelessWidget {
  const DeleteAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Text(
        "حذف الحساب",
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}
