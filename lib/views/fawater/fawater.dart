import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/fawater/fawater_controller.dart';

class Fawater extends StatelessWidget {
  final List<String> dates = ["2028-09-03", "2028-09-03",];

  final List<String> times = ["PM3:05 ", "PM10:05 ",];

  final List<String> titles = [
    TranslationData.washInternalExternal.tr,
TranslationData.basicPackage.tr,  ];

  final List<String> prices = ["119", "119", "10.00"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FawaterController>(
      builder: (ctrl) {
        return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(TranslationData.invoices.tr),

              centerTitle: true,
              toolbarHeight: 100,
              titleTextStyle: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 1.5,
                letterSpacing: 0,
                color: Color(0xff121212),
              ),

              leading: Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: times.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xff8193B3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        times[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: const Color(0xff8193B3),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        dates[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: const Color(0xff8193B3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff29C1F2),
                                      fontFamily: 'IBM Plex Sans Arabic',

                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        prices[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'IBM Plex Sans Arabic',

                                          color: const Color.fromARGB(
                                            255,
                                            0,
                                            0,
                                            0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      // Image.asset(
                                      //   "assets/images/Riyal.png",
                                      //   width: 30,
                                      //   height: 30,
                                      //   fit: BoxFit.contain,
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        );
      },
    );
  }
}
