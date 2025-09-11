import 'package:flutter/material.dart';

import '../../utils/colors/color1.dart';

class PrivacyPolicyScreenAr extends StatelessWidget {
  const PrivacyPolicyScreenAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
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
                  'سياسة الخصوصية',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                      color: baseWhiteColor
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'تطبيق "Helmet" يلتزم بحماية خصوصية مستخدميه. هذه السياسة تشمل كيفية جمعنا، استخدامنا، وكشفنا لمعلوماتك الشخصية.',
              style: TextStyle(fontSize: 16,color: baseWhiteColor),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            buildSectionTitle('لماذا نجمع معلوماتك؟'),
            buildSectionText(
              'نجمع معلوماتك لتقديم تجربة أفضل، وتحسين التطبيق، والتواصل معك.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('أنواع المعلومات التي نجمعها'),
            buildSectionText(
              '1. المعلومات الشخصية: الاسم، البريد الإلكتروني، كلمة المرور (مشفرة).\n'
                  '2. معلومات المستخدم: العمر، الجنس، الوزن، الطول، الأهداف الرياضية.\n'
                  '3. معلومات الجهاز: نظام التشغيل، الإصدار، اللغة.\n'
                  '4. معلومات الموقع: الموقع الجغرافي (إذا سمحت بذلك).\n'
                  '5. بيانات الاستخدام: سجلات الدخول، استخدام الميزات، الأداء الرياضي.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('كيف نستخدم معلوماتك؟'),
            buildSectionText(
              '1. تقديم الخدمات: إدارة حسابك، تقديم المحتوى، إرسال الإشعارات.\n'
                  '2. تحسين التطبيق: تحليل السلوك، تحسين الأداء.\n'
                  '3. التواصل: إرسال تحديثات، عروض، رسائل بريد إلكتروني.\n'
                  '4. الأساس القانوني: الامتثال للقوانين واللوائح.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('من يمكن أن يصل إلى معلوماتك؟'),
            buildSectionText(
              '1. الموظفين والمطورين: لتحسين التطبيق وتقديم الخدمات.\n'
                  '2. الموردين والشركاء: لتقديم الخدمات الإضافية.\n'
                  '3. السلطات القانونية: عند الضرورة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('حقوقك'),
            buildSectionText(
              '1. الوصول إلى المعلومات: يمكنك طلب معلوماتك الشخصية.\n'
                  '2. تعديل المعلومات: يمكنك تحديث معلوماتك الشخصية.\n'
                  '3. حذف المعلومات: يمكنك حذف حسابك ومعلوماتك.\n'
                  '4. الاستعاضة عن الموافقة: يمكنك سحب موافقتك في أي وقت.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('الأمان'),
            buildSectionText(
              '1. تشفير البيانات: تستخدم تشفيرًا قويًا لحماية معلوماتك.\n'
                  '2. النصوص الأمنية: نتبع إجراءات أمنية صارمة.\n'
                  '3. تحديثات الأمان: نطبق تحديثات الأمان بانتظام.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('التغييرات في السياسة'),
            buildSectionText(
              'نحن نحتفظ بالحق في تحديث هذه السياسة. سيتم إعلامك بأي تغييرات كبيرة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('الاتصال'),
            buildSectionText(
              'للمزيد من المعلومات، يرجى الاتصال بنا على [أدخل البريد الإلكتروني] أو [أدخل الموقع الإلكتروني].',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('القبول'),
            buildSectionText(
              'باستخدام التطبيق، أنت توافق على هذه السياسة.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('التاريخ'),
            buildSectionText(
              '08/01/2025',
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
          color: baseWhiteColor
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16,color: baseWhiteColor),
      textAlign: TextAlign.right,
    );
  }
}
