import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helmet_customer/models/subscribe.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class SubscriptionWashStream extends StatelessWidget {
  final String userId;
  

  const SubscriptionWashStream({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: const [
            SizedBox(width: 16),
            CustomText(
              text: "Subscription Plans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 290,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('subscriptions')
                .where('userId', isEqualTo: userId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No subscriptions found"));
              }

              final subscriptions = snapshot.data!.docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                data['id'] = doc.id;
                return Subscribe.fromJson(data);
              }).toList();

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: subscriptions.length,
                itemBuilder: (context, index) {
                  final sub = subscriptions[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        CustomText(
                          text: sub.titleEn ?? sub.titleAr ?? "Subscription",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          text:
                              "Total washes: ${sub.count ?? '-'} | Remaining: ${sub.remain ?? '-'}",
                          fontSize: 12,
                          color: Colors.grey,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '${sub.price ?? 0}',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.attach_money,
                                size: 14, color: AppColors.primary),
                          ],
                        ),
                        const SizedBox(height: 6),
                        CustomText(
                          text: sub.isPaid == true ? "Paid" : "Not Paid",
                          fontSize: 12,
                          color: sub.isPaid == true
                              ? Colors.green
                              : Colors.redAccent,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
