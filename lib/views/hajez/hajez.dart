import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/hajez/hajez_controller.dart';

class Hajez extends StatelessWidget {
  const Hajez({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HajezController>(
      builder: (ctrl) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "الباقات",
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  height: 1.5,
                  letterSpacing: 0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              centerTitle: true,
              toolbarHeight: 60,
              leading: Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 180,
                          child: GestureDetector(
                            onTap: () {
                              ctrl.changeTab("my");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: ctrl.currentTab == "my"
                                    ? Color(0xff29C1F2)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "باقتي",
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans Arabic',
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  height: 1.5,
                                  letterSpacing: 0,
                                  color: ctrl.currentTab == "my"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                          width: 180,
                          child: InkWell(
                            onTap: () {
                              ctrl.changeTab("all");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ctrl.currentTab == "all"
                                      ? Color(0xff29C1F2)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "جميع الباقات",
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    height: 1.5,
                                    letterSpacing: 0,
                                    color: ctrl.currentTab == "my"
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ctrl.packages.isEmpty
                        ?const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 120),
                                Icon(
                                  Icons.event_busy,
                                  size: 80,
                                  color: Color(0xff29C1F2),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "لا يوجد باقات",
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    height: 1.5,
                                    letterSpacing: 0,
                                    color: Color(0xff8193B3),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "باقات التوفير",
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans Arabic',
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20,
                                      height: 1.5,
                                      letterSpacing: 0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,

                                  itemCount: ctrl.packages.length,
                                  itemBuilder: (context, index) {
                                    final package = ctrl.packages[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SizedBox(
                                        height: 220,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                255,
                                                219,
                                                223,
                                                230,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(width: 10),

                                                  SizedBox(
                                                    height: 24,
                                                    width: 67,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                          0xff29C1F2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              6,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              3.0,
                                                            ),
                                                        child: Text(
                                                          " وفر" +
                                                              package["discount"],
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                            fontFamily:
                                                                'IBM Plex Sans Arabic',

                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  // SizedBox(
                                                  //   width: 62,
                                                  //   height: 21,
                                                  //   child: Image.asset(
                                                  //     "assets/images/tabby.PNG",
                                                  //     fit: BoxFit.cover,
                                                  //   ),
                                                  // ),
                                                  // SizedBox(width: 10),
                                                  // SizedBox(
                                                  //   width: 60,
                                                  //   height: 20,
                                                  //   child: Image.asset(
                                                  //     "assets/images/tamara.PNG",
                                                  //     fit: BoxFit.cover,
                                                  //   ),
                                                  // ),
                                                  SizedBox(width: 50),
                                                  Container(
                                                    width: 40,
                                                    height: 45,
                                                    decoration:const BoxDecoration(
                                                      color: Color(0xff07729D),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                  10,
                                                                ),
                                                            bottomRight:
                                                                Radius.circular(
                                                                  10,
                                                                ),
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Text(
                                                  package["title"],
                                                  style:const TextStyle(
                                                    fontFamily:
                                                        'IBM Plex Sans Arabic',
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15,
                                                    height: 1.5,
                                                    letterSpacing: 0,
                                                    color: Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                    ),
                                                child: Text(
                                                  package["description"],
                                                  style:const TextStyle(
                                                    fontFamily:
                                                        'IBM Plex Sans Arabic',
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                    letterSpacing: 0,
                                                    color: Color(0xff8193B3),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  0.0,
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    width: 330,
                                                    height: 55,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff0A6082),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            8.0,
                                                          ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  8.0,
                                                                ),
                                                            child: Text(
                                                              package["price"],

                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'IBM Plex Sans Arabic',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 20,
                                                                height: 1.5,
                                                                letterSpacing:
                                                                    0,
                                                                color:
                                                                    Color.fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Image.asset(
                                                          //   "assets/images/rr.PNG",
                                                          //   width: 25,
                                                          //   height: 25,
                                                          // ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "(${package["unit"]} ريال لكل غسلة)",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'IBM Plex Sans Arabic',

                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 14,
                                                              height: 1.5,
                                                              letterSpacing: 0,
                                                              color:
                                                                  Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255,
                                                                  ),
                                                            ),
                                                          ),
                                                          Spacer(),

                                                          Center(
                                                            child: IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                size: 18,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                              ],
                            ),
                          ),
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
