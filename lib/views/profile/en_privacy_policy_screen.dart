import 'package:flutter/material.dart';
import 'package:helmet_customer/utils/colors/color1.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: baseWhiteColor,
                      fontFamily: 'IBMPlexSansArabic'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '[App Name] ("Helmet") is committed to protecting your privacy. This policy explains how we collect, use, and disclose your personal information.',
              style: TextStyle(fontSize: 16, color: baseWhiteColor, fontFamily: 'IBMPlexSansArabic'),
            ),
            const SizedBox(height: 20),
            buildSectionTitle('Why We Collect Your Information'),
            buildSectionText(
              'We collect your information to provide a better experience, improve the App, and communicate with you.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Types of Information We Collect'),
            buildSectionText(
              '1. Personal Information: Name, email, password (encrypted).\n'
              '2. User Information: Age, gender, weight, height, fitness goals.\n'
              '3. Device Information: Operating system, version, language.\n'
              '4. Location Information: Geographical location (if permitted).\n'
              '5. Usage Data: Login records, feature usage, fitness performance.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('How We Use Your Information'),
            buildSectionText(
              '1. Service Provision: Managing your account, delivering content, sending notifications.\n'
              '2. App Improvement: Analyzing behavior, enhancing performance.\n'
              '3. Communication: Sending updates, offers, emails.\n'
              '4. Legal Compliance: Adhering to laws and regulations.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Who Can Access Your Information'),
            buildSectionText(
              '1. Employees and Developers: Improving the App and services.\n'
              '2. Vendors and Partners: Providing additional services.\n'
              '3. Law Enforcement: When necessary.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Your Rights'),
            buildSectionText(
              '1. Access: Request your personal information.\n'
              '2. Modification: Update your personal information.\n'
              '3. Deletion: Delete your account and information.\n'
              '4. Withdrawal of Consent: Withdraw consent at any time.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Security'),
            buildSectionText(
              '1. Data Encryption: We use strong encryption to protect your information.\n'
              '2. Security Measures: We follow strict security procedures.\n'
              '3. Security Updates: We regularly apply security updates.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Changes to This Policy'),
            buildSectionText(
              'We reserve the right to update this policy. You will be notified of significant changes.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Contact'),
            buildSectionText(
              'For more information, please contact us at [email address] or [website URL].',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Acceptance'),
            buildSectionText(
              'By using the App, you agree to this policy.',
            ),
            const SizedBox(height: 10),
            buildSectionTitle('Date'),
            buildSectionText(
              '08/01/2025',
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
          fontSize: 18, fontWeight: FontWeight.bold, color: baseWhiteColor, fontFamily: 'IBMPlexSansArabic'),
    );
  }

  Widget buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: baseWhiteColor, fontFamily: 'IBMPlexSansArabic'),
    );
  }
}
