import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/editprofile/widget/CustomTextField.dart';
import 'package:helmet_customer/views/gifts/widget/elevatedbutton.dart';
import 'package:helmet_customer/views/share_packages/ahare_package_widget.dart';
import 'package:helmet_customer/views/share_packages/share_package_controller.dart';
import 'package:helmet_customer/views/share_packages/showStatusBottomSheet2.dart';

void showSharePackageBottomSheet(BuildContext context, String packageId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 🔹 يسمح للشيت يطلع فوق الكيبورد
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: GetBuilder<SharePackagesController>(
            init: SharePackagesController(packageId),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xff29C1F2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            "شارك باقتك!",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'IBMPlexSansArabic',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          Assets.sharepackageblack,
                          width: 27.21,
                          height: 27.29,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      TranslationData.recipientPhoneNumber.tr,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        height: 0.25,
                        letterSpacing: 0,
                        color: Color(0xff121212),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustompackageTextField(
                    controller: controller.phoneController,
                    hintText: "05xxxxxxxxx",
                    prefixIcon: Image.asset(
                      Assets.flag,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "عدد الغسلات يلي حاب تشاركه",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        height: 0.25,
                        letterSpacing: 0,
                        color: Color(0xff121212),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustompackageTextField(
                        controller: controller.numberOfWashes,
                        hintText: "",
                        width: 210,
                        sufixtext: "غسلة",
                        textStyle: const TextStyle( fontSize: 20, color: Color(0xff29C1F2), fontWeight: FontWeight.bold, fontFamily: 'IBMPlexSansArabic', ), 
                      ),
                      CircularIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          controller.decrementWashes();
                        },
                      ),
                      CircularIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          controller.incrementWashes();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  button(
                    title: "مشاركة الباقة",
                    onPressed: () async {
  final result = await controller.sendPackage(); // نفذ الفنكشن وانتظر النتيجة

  // إذا فيه Bottom Sheet مفتوح، اغلقه
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }

  // عرض Bottom Sheet حسب النتيجة
  showStatusBottomSheet2(
    context,
    mainText: result["message"] ?? 'حدث خطأ',
    imageAsset: result['success'] == true
        ? 'assets/images/true.png'
        : 'assets/images/false.png',
    color: result['success'] == true ? const Color(0xff00C069) : Colors.red,
  );
},
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
