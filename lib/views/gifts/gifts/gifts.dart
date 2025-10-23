
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts2.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_binding.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/gifts/widget/appbar.dart';
import 'package:helmet_customer/views/gifts/widget/elevatedbutton.dart';
import 'package:helmet_customer/views/gifts/widget/listview.dart';

class giftspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appbar(text: "الحجوزات السابقة"),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mylistview(),
                button(
                  title: "إرسال هدية",
                  onPressed: () {
               Get.toNamed(RoutesString.sendgifts);
                  },
                ),
                SizedBox(height: 20),
              const  Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    "تاريخ الهدايا",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: 0,
                      color: Color(0xff121212),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 231, 234, 239),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                     const Text(
                                        "2028-09-03",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: const Color(0xff8193B3),
                                        ),
                                      ),
                                      SizedBox(height: 8),

                                      Row(
                                        children: [
                                         const Text(
                                            "59.25",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  'IBM Plex Sans Arabic',

                                              color: const Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Image.asset(
                                           Assets.reyalblack,
                                            width: 18,
                                            height: 18,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                               const Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "تم تطبيقه",
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans Arabic',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Color(0xff29C1F2),
                                    ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
