import 'package:flutter/material.dart';

import '../../utils/colors/color1.dart';

class TermsAndConditionsScreenAr extends StatelessWidget {
  const TermsAndConditionsScreenAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الشروط والأحكام لتطبيق Helmet',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: baseWhiteColor),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'آخر تحديث: [أدخل التاريخ]',
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: baseWhiteColor),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            Text(
              'مرحبًا بك في تطبيق Helmet! تحكم هذه الشروط والأحكام ("الشروط") وصولك واستخدامك لتطبيقنا الخاص بتتبع اللياقة البدنية ("التطبيق"). باستخدام تطبيق Helmet، فإنك توافق على الالتزام بهذه الشروط. إذا كنت لا توافق على هذه الشروط، يرجى الامتناع عن استخدام التطبيق.',
              style: TextStyle(fontSize: 16, color: baseWhiteColor),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            buildSectionTitle('1. قبول الشروط'),
            buildSectionText(
              'عند تنزيل أو تثبيت أو استخدام تطبيق Helmet، فإنك تؤكد أنك قرأت وفهمت ووافقت على هذه الشروط.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('2. الأهلية'),
            buildSectionText(
              'يجب أن يكون عمرك 18 عامًا على الأقل أو أن يكون لديك إذن من ولي الأمر القانوني لاستخدام التطبيق. باستخدام التطبيق، فإنك تؤكد أنك تستوفي هذه المتطلبات.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('3. غرض التطبيق'),
            buildSectionText(
              'تطبيق Helmet هو تطبيق لتتبع اللياقة البدنية مصمم لمساعدة الرياضيين على مراقبة أنشطتهم الرياضية. يوفر تتبع وتحليل لدعم رحلتك في اللياقة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('4. مسؤوليات المستخدم'),
            buildSectionText(
              '- يجب استخدام التطبيق فقط للأغراض القانونية ووفقًا للقوانين واللوائح المعمول بها.\n'
              '- يجب عدم إساءة استخدام التطبيق أو محاولة التدخل في تشغيله أو استخدامه بأي طريقة قد تضر بالتطبيق أو المستخدمين الآخرين.\n'
              '- تعتمد دقة بيانات النشاط واللياقة على المدخلات الخاصة بك ووظائف الجهاز. تطبيق Helmet غير مسؤول عن الأخطاء الناتجة عن إدخال غير صحيح أو قيود الأجهزة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('5. الإعلانات'),
            buildSectionText(
              'يتضمن تطبيق Helmet إعلانات. باستخدام التطبيق، فإنك توافق على ظهور الإعلانات أثناء استخدامك للتطبيق. نسعى لضمان أن تكون الإعلانات ذات صلة، ولكننا لا نتحكم أو نصادق على محتوى الإعلانات من الأطراف الثالثة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('6. حقوق الملكية الفكرية'),
            buildSectionText(
              'جميع المحتويات والعلامات التجارية والمواد داخل تطبيق Helmet هي ملك للتطبيق أو الجهات المرخصة له. لا يُسمح بنسخ أو تعديل أو توزيع أو استغلال أي جزء من التطبيق دون إذن كتابي مسبق.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('7. إخلاء المسؤولية عن الضمانات'),
            buildSectionText(
              '- يتم توفير التطبيق "كما هو" و"كما هو متاح"، دون أي ضمانات من أي نوع، سواء كانت صريحة أو ضمنية.\n'
              '- لا يضمن تطبيق Helmet أن الخدمة ستكون غير منقطعة أو خالية من الأخطاء أو تلبي احتياجاتك الخاصة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('8. حدود المسؤولية'),
            buildSectionText(
              'إلى أقصى حد يسمح به القانون، لن يكون تطبيق Helmet أو الشركات التابعة له مسؤولين عن أي أضرار مباشرة أو غير مباشرة أو عرضية أو تبعية ناتجة عن استخدامك للتطبيق.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('9. تعديلات على الشروط'),
            buildSectionText(
              'يحتفظ تطبيق Helmet بالحق في تحديث أو تعديل هذه الشروط في أي وقت. ستكون التغييرات سارية فور نشرها. يشير استمرار استخدامك للتطبيق بعد التغييرات إلى موافقتك على الشروط المعدلة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('10. الإنهاء'),
            buildSectionText(
              'نحتفظ بالحق في تعليق أو إنهاء وصولك إلى التطبيق في أي وقت، مع أو بدون سبب، ودون إشعار مسبق.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('11. القانون المعمول به'),
            buildSectionText(
              'تخضع هذه الشروط وتُفسر وفقًا لقوانين الولايات المتحدة الامريكية .',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('12. اتصل بنا'),
            buildSectionText(
              'إذا كان لديك أي أسئلة أو استفسارات حول هذه الشروط، يرجى الاتصال بنا على   Abdullahbus511@gmail.com   .',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: baseWhiteColor),
      textAlign: TextAlign.right,
    );
  }

  Widget buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: baseWhiteColor),
      textAlign: TextAlign.right,
    );
  }
}
