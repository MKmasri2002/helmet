import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

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
  void _goTosharepage() {
    if (FirebaseAuth.instance.currentUser == null) {
      _showError('Please login first');
      return;
    }
    //Get.to(() => const AddressBookView(), binding: AddressBookBinding());
    Get.toNamed(RoutesString.sharepage);
  }

  void _showError(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    });
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
              image: Assets.tone,
              icon2: Icons.keyboard_arrow_down_outlined,
              text: TranslationData.apartment.tr,
              onTap: _goToAddressBook,
            ),
            const Spacer(),
            HeaderButton(
              image: Assets.givestar,
              text: TranslationData.shareAndWin.tr,
              onTap:_goTosharepage,
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  final String image;
  final IconData? icon2;
  final String text;
  final GestureTapCallback onTap;
  const HeaderButton(
      {super.key,
      required this.image,
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
            ImageIcon(AssetImage(image), color: Colors.black, size: 30),
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
