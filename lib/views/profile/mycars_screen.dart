import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/languages/translation_data.dart';
import 'package:helmet_customer/utils/routes/routes_string.dart';
import 'package:helmet_customer/views/add_car/add_car_controller.dart';

class Mycarspage extends StatelessWidget {
  const Mycarspage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(
      builder: (ctrl) {
        return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title:  Text(TranslationData.myCars.tr),
              centerTitle: true,
              toolbarHeight: 100,
              titleTextStyle: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff121212),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
              actions: [
                Padding(
    padding:const EdgeInsets.symmetric(horizontal: 18, vertical: 20), 
                child: ElevatedButton(
  onPressed: () {
    Get.toNamed(RoutesString.addcar);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 223, 240, 248),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 1,
    padding:const EdgeInsets.symmetric(horizontal: 4, vertical: 4), 
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
     
      Text(
        TranslationData.add.tr,
        style: const TextStyle(
          color: Colors.lightBlue,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
          const  SizedBox(width: 3), 

      const Icon(Icons.add, color: Colors.lightBlue, size: 20),
    ],
  ),
)

                ),
              ],
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: ctrl.getUserCarsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No cars found."));
                }
                final cars = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: cars.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final car = cars[index].data() as Map<String, dynamic>;
                    return Container(
                      height: 90,
                      margin: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(255, 236, 235, 235),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            car["image"],
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            car["brand"],
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesString.addcar);
                                  },
                                  child: Image.asset(
                                    Assets.edit,
                                    height: 30,
                                  ),
                                ),
                              const  SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    ctrl.deleteCar(cars[index].id);
                                  },
                                  child: Image.asset(
                                    Assets.delete,
                                    height: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
        );
      },
    );
  }
}
