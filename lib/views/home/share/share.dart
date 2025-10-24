import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/gifts/widget/elevatedbutton.dart';
import 'package:helmet_customer/views/home/share/widget/container.dart';
import 'package:helmet_customer/views/home/share/widget/mytext.dart';
import 'package:helmet_customer/views/home/share/widget/ontapcontainer.dart';

class Sharepage extends StatelessWidget {
  const Sharepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Mytext(text: "شارك واربح", color: Colors.black, fontSize: 18),
          leading: Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  mycontainer(
                    height: 330,
                    width: 300,
                    backgroundColor: Color(0xff29C1F2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(Assets.coins),
                          Mytext(
                            text: "اربح 15 ريال مع كل غسلة!",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          Mytext(
                            text:
                                "شارك اصدقائك تطبيق هملت واحصل 15 ريال لكل\nمستخدم جديد أتم حجزه بإستخدام الرابط الخاص بك",
                            fontSize: 15,
                            textAlign: TextAlign.center,
                          ),
                          button(
                  title: "إرسال هدية",
                  textcolor: Color(0xff29C1F2),
                  backgroundColor: Colors.white,
                  
                  onPressed: () {
               Get.toNamed(RoutesString.sendgifts);
                  },
                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Mytext(
                      text: "الشروط والاحكام",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  mycontainer(
                    backgroundColor: Color(0xffF0FAFF),
                    borderColor: Colors.blue.shade200,
                    bottomShadow: false,
                    padding: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Mytext(
                            text: "1. متاح للمستخدمين الجدد فقط.",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff07729D),
                          ),
                         const SizedBox(height: 6),
                        const  Mytext(
                            text: "2. الحد الأقصى 15 ريال لكل حجز.",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff07729D),
                          ),
                          SizedBox(height: 6),
                          Mytext(
                            text:
                                "3. يُستخدم الرصيد على الغسلة الواحدة فقط، شامل الخدمات الإضافية.",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff07729D),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 9),
                const  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Mytext(
                      text: "خطوات الحصول على الرصيد",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 20),
                const  mycontainer(
                    bottomShadow: true,
                    padding: const EdgeInsets.all(16),
                    child: OntapContainer(
                      text1: "شارك الرابط الخاص بك",
                      text2:
                          "انسخ الرابط وأرسله لأصدقائك عبر الواتساب أو الرسائل.",
                          icon: Assets.share,
                    ),
                  ),
                  SizedBox(height: 20),
                const  mycontainer(
                    bottomShadow: true,
                    padding: const EdgeInsets.all(16),
                    child: OntapContainer(
                      
                      text1: "كيف تكسب رصيدك",
                      text2:
                          "ستحصل على 15 ريال بالمحفظة عند اتمام كل مستخدم جديد اول غسلة.\nسيحصل صديقك على 15 ريال بالمحفظة بعد اتمام اول غسلة.", icon: Assets.person,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
