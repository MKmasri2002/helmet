import 'package:flutter/material.dart';

import '../../utils/colors/color1.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terms and Conditions for Helmet',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Last Updated: 09-01-2025',
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: baseWhiteColor),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to Helmet! These Terms and Conditions ("Terms") govern your access to and use of our fitness tracker app ("App"). By using Helmet, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, please refrain from using the App.',
              style: TextStyle(fontSize: 16, color: baseWhiteColor),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('1. Acceptance of Terms'),
            _buildSectionText(
              'By downloading, installing, or using Helmet, you confirm that you have read, understood, and agree to these Terms.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('2. Eligibility'),
            _buildSectionText(
              'You must be at least 18 years old or have the permission of a legal guardian to use the App. By using the App, you confirm that you meet these requirements.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('3. App Purpose'),
            _buildSectionText(
              'Helmet is a fitness tracker designed to help athletes monitor their fitness activities. It provides tracking and analytics to support your fitness journey.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('4. User Responsibilities'),
            _buildSectionText(
              '- You agree to use the App only for lawful purposes and in compliance with applicable laws and regulations.\n'
              '- You must not misuse the App, attempt to interfere with its operations, or use it in any way that could harm the App or other users.\n'
              '- The accuracy of fitness and activity data depends on user input and device functionality. Helmet is not responsible for inaccuracies due to incorrect input or device limitations.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('5. Advertisements'),
            _buildSectionText(
              'Helmet contains advertisements. By using the App, you agree that advertisements may appear during your use of the App. We strive to ensure that ads are relevant, but we do not control or endorse third-party ad content.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('6. Intellectual Property'),
            _buildSectionText(
              'All content, trademarks, and materials within Helmet are the property of the App or its licensors. You are not permitted to copy, modify, distribute, or exploit any part of the App without prior written consent.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('7. Disclaimer of Warranties'),
            _buildSectionText(
              '- The App is provided "as is" and "as available," without warranties of any kind, express or implied.\n'
              '- Helmet does not guarantee uninterrupted service or that the App will be error-free or meet your specific needs.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('8. Limitation of Liability'),
            _buildSectionText(
              'To the fullest extent permitted by law, Helmet and its affiliates will not be liable for any direct, indirect, incidental, or consequential damages arising from your use of the App.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('9. Modifications to Terms'),
            _buildSectionText(
              'Helmet reserves the right to update or modify these Terms at any time. Changes will be effective immediately upon posting. Your continued use of the App after changes indicates your acceptance of the updated Terms.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('10. Termination'),
            _buildSectionText(
              'We reserve the right to suspend or terminate your access to the App at any time, with or without cause, and without prior notice.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('11. Governing Law'),
            _buildSectionText(
              'These Terms are governed by and construed in accordance with the laws of USA.',
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('12. Contact Us'),
            _buildSectionText(
              'If you have any questions or concerns about these Terms, please contact us at  Abdullahbus511@gmail.com  .',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: baseWhiteColor),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: baseWhiteColor),
    );
  }
}
