import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';
import 'package:helmet_customer/views/address/address_binding.dart';
import 'package:helmet_customer/views/address/address_screen.dart';

class TopHeaderHome extends StatelessWidget {
  const TopHeaderHome({super.key});

  void _goToAddressBook() {
    if (FirebaseAuth.instance.currentUser == null) {
      _showError('Please login first');
      return;
    }
    //Get.to(() => const AddressBookView(), binding: AddressBookBinding());
    Get.toNamed(RoutesString.addressBook);
  }

  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  Widget buildAddressWidget() {
    return GestureDetector(
      onTap: _goToAddressBook,
      child: CustomText(
        text: TranslationData.apartment.tr,
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            HeaderButton(
              icon1: Icons.location_on_outlined,
              icon2: Icons.keyboard_arrow_down_outlined,
              text: TranslationData.apartment.tr,
              onTap: _goToAddressBook,
            ),
            const Spacer(),
            HeaderButton(
              icon1: Icons.star,
              text: TranslationData.shareAndWin.tr,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  final IconData icon1;
  final IconData? icon2;
  final String text;
  final GestureTapCallback onTap;
  const HeaderButton(
      {super.key,
      required this.icon1,
      this.icon2,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(230),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon1, color: Colors.black, size: 22),
            const SizedBox(width: 8),
            CustomText(
              text: text,
              color: Colors.black,
              fontSize: 14,
            ),
            Icon(icon2, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
