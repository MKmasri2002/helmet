import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/views/gifts/gifts/gifts_controller.dart';
import 'package:http/http.dart';

class mylistview extends StatelessWidget {
  final bool i;
  final String price;
  const mylistview({super.key, this.i = false, this.price = "0"});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<giftsController>(builder: (ctrl) {
      return SizedBox(
          height: 200,
          child: StreamBuilder<QuerySnapshot>(
              stream: ctrl.getgiftcardStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No gifts found."));
                }
                final giftcard = snapshot.data!.docs;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: giftcard.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 25,
                          width: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF1D840),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  price,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Image.asset(
                                  Assets.reyalblack,
                                  width: 16,
                                  height: 16,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }));
    });
  }
}
