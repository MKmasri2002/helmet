import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/helps/helps_controller.dart';

class HelpPage extends StatelessWidget {
  final List<String> help = [
    " الأسئلة المتكررة",
    " عن طريق الواتس اب",
    "عن طريق البريد الإلكتروني",
  ];

  final List<String> icon = [
    Assets.help,
    Assets.whatsapp,
    Assets.emailhelp,
  ];

  HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double sizebox20 = h * 0.02;

    // ✅ debugPrint صحيح هنا خارج أي widget
    debugPrint('help length: ${help.length}, icon length: ${icon.length}');

    return GetBuilder<HelpsController>(
      builder: (ctrl) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text("مساعدة"),
              centerTitle: true,
              toolbarHeight: h / 7.5,
              titleTextStyle: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1.5,
                letterSpacing: 0,
                color: Color(0xff121212),
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(h * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: w * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 193, 192, 192).withAlpha(150),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(h * 0.02),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: icon.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              icon[index],
                                              width: 24,
                                              height: 24,
                                            ),
                                            SizedBox(width: sizebox20),
                                            Text(
                                              help[index],
                                              style: const TextStyle(
                                                fontFamily: 'IBM Plex Sans Arabic',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.5,
                                                color: Color(0xff121212),
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 0.8,
                                        width: w * 0.9,
                                        color: const Color.fromARGB(255, 226, 226, 226)
                                            .withAlpha(150),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
