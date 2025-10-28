import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/home/home_binding.dart';
import 'package:helmet_customer/views/home/home_screen/home_screen.dart';

class FeedbackScreen2 extends StatelessWidget {
  const FeedbackScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("تقييم الغسيل"),
          centerTitle: true,
          toolbarHeight: 72,
          titleTextStyle: const TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 1.5,
            letterSpacing: 0,
            color: Color(0xff121212),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: pageWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Image.asset(
                    "assets/images/star.PNG",
                    height: 150,
                    width: 150,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "شكراً لتقييم الخدمة ",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        height: 0.28,
                        letterSpacing: 0,
                        color: Color(0xff121212),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "شكرًا لإختياركم سويتر",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      height: 0.24,
                      letterSpacing: 0,
                      color: Color(0xff8193B3),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "رضاكم هو أولويتنا ويسعدنا خدمتكم",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      height: 0.24,
                      letterSpacing: 0,
                      color: Color(0xff8193B3),
                    ),
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    height: pageHeight * .07,
                    width: pageWidth * .9,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.back();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 14, 40, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0xff29C1F2),
                      ),
                      child: const Text(
                        "العودة الى الصفحة الرئيسية",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
