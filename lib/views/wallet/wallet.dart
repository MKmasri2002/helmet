import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/views/wallet/wallet_controller.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      builder: (ctrl) {
        return  Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title:  Text(
               TranslationData.myWallet.tr,
                style:const TextStyle(
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
              toolbarHeight: 100,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),

                  SizedBox(
                    height: 130,
                    width: 400,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff07729D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TranslationData.balance.tr,
                              style:const TextStyle(
                                fontFamily: 'IBM Plex Sans Arabic',
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 22,
                                height: 1.5,
                                letterSpacing: 0,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                             const   Text(
                                  '299.00',
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans Arabic',
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                    height: 1.5,
                                    letterSpacing: 0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Image.asset(
                                 Assets.reyalwhite,
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff29C1F2).withAlpha(125),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        TranslationData.apply.tr,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
      },
    );
  }
}
