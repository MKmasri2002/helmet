import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/feedback/controller/feedback_controller.dart';
import 'package:helmet_customer/views/feedback/screen/feedback_screen2.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return GetBuilder<FeedbackController>(
      builder: (ctrl) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text("تقييم الغسيل"),
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
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: pageWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "تقييم خدمة الغسيل",
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 0.28,
                          letterSpacing: 0,
                          color: Color(0xff121212),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: pageWidth * .85,
                        height: pageWidth * .2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ctrl.list.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Image.asset(
                                ctrl.updated[index],
                                width: 62.73,
                                height: 62.73,
                              ),
                              onTap: () {
                                ctrl.index = index;
                                ctrl.changestate();
                                ctrl.changebuttonstate();
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "منح تقييم 5-1 نجوم 1 مخيب للآمال و 5 راضٍ",
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
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 80),
                            if (ctrl.index >= 0) ...[
                              Text(
                                "اصنع سعادة البايكر بهديه تحلي يومه",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans Arabic',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 0.24,
                                  letterSpacing: 0,
                                  color: Color(0xff121212),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "سيحصل البايكر على المبلغ كامل",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans Arabic',
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  height: 0.2,
                                  letterSpacing: 0,
                                  color: Color(0xff8193B3),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: pageWidth * .8,
                                height: pageWidth * .3,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ctrl.price.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 80,
                                      height: 150,
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    8,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    8,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          20,
                                                        ),
                                                      ),
                                                    ),
                                                    builder: (context) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                            context,
                                                          ).viewInsets.bottom,
                                                          top: 20,
                                                          left: 20,
                                                          right: 20,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Center(
                                                              child: Container(
                                                                height: 4,
                                                                width: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                    0xff29C1F2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    2,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                20,
                                                              ),
                                                              child: Text(
                                                                "ادخل المبلغ",
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'IBM Plex Sans Arabic',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 20,
                                                                  height: 0.25,
                                                                  letterSpacing:
                                                                      0,
                                                                  color: Color(
                                                                    0xff121212,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              width: pageWidth,
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      "50.00",
                                                                  alignLabelWithHint:
                                                                      true,
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        Color(
                                                                      0xff8193B3,
                                                                    ),
                                                                    fontFamily:
                                                                        'IBM Plex Sans Arabic',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height:
                                                                        0.18,
                                                                    letterSpacing:
                                                                        0,
                                                                  ),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      12,
                                                                    ),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color:
                                                                          Color(
                                                                        0xff29C1F2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      12,
                                                                    ),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color:
                                                                          Color(
                                                                        0xff29C1F2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  prefixIcon:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                      12,
                                                                    ),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          14,
                                                                      width: 14,
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/images/real.PNG",
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 60,
                                                            ),
                                                            SizedBox(
                                                              width: pageWidth,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "تأكيد",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'IBM Plex Sans Arabic',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 1.5,
                                                                    letterSpacing:
                                                                        0,
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Color(
                                                                    0xff29C1F2,
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        14,
                                                                  ),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      8,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  height: 100,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffF0FAFF),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                        8,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(
                                                        8,
                                                      ),
                                                    ),
                                                  ),
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          ctrl.price.values
                                                              .toList()[index],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        if (index !=
                                                            ctrl.price.length -
                                                                1)
                                                          Image.asset(
                                                            "assets/images/real.PNG",
                                                            height: 18,
                                                            width: 18,
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 40,
                                              left: 0,
                                              right: 0,
                                              child: Image.asset(
                                                ctrl.price.keys.toList()[index],
                                                height: 65,
                                                width: 65,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: pageHeight * .07,
                        width: pageWidth * .85,
                        child: ElevatedButton(
                          onPressed: ctrl.ButtonEnabled
                              ? () {
                                  Get.to(() => FeedbackScreen2());
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(40, 14, 40, 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xff29C1F2),
                            disabledBackgroundColor: Color(
                              0xff29C1F2,
                            ).withAlpha(128),
                          ),
                          child: Text(
                            "إرسال التقييم",
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
      },
    );
  }
}
