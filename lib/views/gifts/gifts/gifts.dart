import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/gifts/gifts/listview.dart';
import 'package:helmet_customer/views/gifts/widget/appbar.dart';
import 'package:helmet_customer/views/gifts/widget/elevatedbutton.dart';
import 'package:intl/intl.dart';

class giftspage extends StatelessWidget {
  const giftspage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appbar(text: TranslationData.gifts.tr),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 أولاً: الليست
                const mylistviewgift(),

                // 🔹 ثانيًا: الزر
                button(
                  title: TranslationData.sendGift.tr,
                  onPressed: () {
                    Get.toNamed(RoutesString.sendgifts);
                  },
                ),

                const SizedBox(height: 20),

                // 🔹 ثالثًا: العنوان قبل عرض الهدايا
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    TranslationData.giftDate.tr,
                    style: const TextStyle(
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

                // 🔹 وأخيرًا: StreamBuilder لعرض بيانات الهدايا
                StreamBuilder<QuerySnapshot>(
                  stream: ctrl.getgiftsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No gifts found."));
                    }

                    final gifts = snapshot.data!.docs;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: gifts.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final gift =
                              gifts[index].data() as Map<String, dynamic>;
                          final timestamp = gift["date"] as Timestamp?;
                          final dateString = timestamp != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(timestamp.toDate())
                              : "-";

                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 231, 234, 239),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dateString,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff8193B3),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                gift.containsKey('price') ? gift['price'].toString() : 'غير متوفر',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      'IBM Plex Sans Arabic',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 3),
                                              Image.asset(
                                                Assets.reyalblack,
                                                width: 24,
                                                height: 22,
                                                fit: BoxFit.contain,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        TranslationData.applied.tr,
                                        style: const TextStyle(
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
                    );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: const SizedBox(
            height: 100,
            child: CustomNavBar(pos: 3)),
        );
      },
    );
  }
}
