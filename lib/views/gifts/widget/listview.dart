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
<<<<<<< HEAD
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
=======
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.sendgifts,
                                        height: 200,
                                      ),
                                      Text(
                                        giftcard[index]["title"],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            giftcard[index]["price"].toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Image.asset(
                                            Assets.reyalblack,
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      TextButton(
                                          onPressed: () {
                                            ctrl.chooseCard(
                                              title: giftcard[index]["title"],
                                              name: giftcard[index]["name"],
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "اختيار الهدية",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                  image: AssetImage(Assets.sendgifts),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            if (i == true)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 25,
                                    width: 75,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffF1D840),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            giftcard[index]["price"].toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  'IBM Plex Sans Arabic',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Image.asset(
                                            Assets.reyalblack,
                                            width: 20,
                                            height: 20,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
>>>>>>> c16ffb5f0a5c2e0efc6473c9ba33a6860fa02f48
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }));
    });
  }
}
