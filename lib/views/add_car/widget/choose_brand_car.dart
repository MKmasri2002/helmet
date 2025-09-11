import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/add_car/add_car_controller.dart';

class ChooseBrandCar extends StatelessWidget {
  const ChooseBrandCar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(
      builder: (ctrl) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.sizeOf(context).height * 0.7,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Your Brand',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Add your brand selection UI here
                // For example, a list of brands to choose from
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ctrl.carsModel.cars!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ctrl.carsModel.cars![index].brand!),
                      onTap: () {
                        ctrl.selectedBrand = ctrl.carsModel.cars![index].brand!;
                        ctrl.carType.clear();
                        ctrl.selectedModel = 'Select model';
                        ctrl.carType = ctrl.carsModel.cars![index].models!;
                        ctrl.update();
                        Get.back();
                      },
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
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
