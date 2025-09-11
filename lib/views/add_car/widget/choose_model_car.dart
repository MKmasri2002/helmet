import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/add_car/add_car_controller.dart';

class ChooseModelCar extends StatelessWidget {
  const ChooseModelCar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(
      builder: (ctrl) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height *0.7,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Model Car',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ctrl.carType.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ctrl.carType[index]),
                      onTap: () {
                        ctrl.selectedModel = ctrl.carType[index];
                        ctrl.update();
                        Get.back();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
