import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/helps/helps_controller.dart';

class HelpPage extends StatelessWidget {
  final List<String> help = [
    " الأسئلة المتكررة",
    " عن طريق الواتس اب",
  ];

  final List<String> icon = [
    Assets.help,
    Assets.whatsapp,
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
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: icon.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
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
                          if(index != icon.length - 1)
                          const Divider()
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
