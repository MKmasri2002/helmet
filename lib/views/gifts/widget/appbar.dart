import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool withleading;
  final VoidCallback? ontap;
  const appbar({
    super.key,
    required this.text,
    this.withleading = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        return AppBar(
          backgroundColor: Colors.white,
          title: Text(text),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            height: 1.5,
            letterSpacing: 0,
            color: Color(0xff121212),
          ),
          leading: withleading
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: IconButton(
                    onPressed: () {
                      ontap;
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
