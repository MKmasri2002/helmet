import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/utils/widgets/custom_nav_bar.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts2.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_binding.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:helmet_customer/views/gifts/widget/appbar.dart';
import 'package:helmet_customer/views/gifts/widget/elevatedbutton.dart';
import 'package:helmet_customer/views/gifts/widget/listview.dart';
import 'package:intl/intl.dart';

class giftspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appbar(text: "الحجوزات السابقة"),
          body: StreamBuilder<QuerySnapshot>(
            stream: ctrl.getgiftsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No gifts found."));
              }
              final gifts = snapshot.data!.docs;

              return Column(
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
                  Padding(
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
                      itemCount: gifts.length,
                      shrinkWrap: true,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dateString,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: const Color(0xff8193B3),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              gift["value"],
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
                                              width: 24,
                                              height: 22,
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
              );
            },
          ),
          bottomNavigationBar: const CustomNavBar(pos: 3),
        );
      },
    );
  }
}
