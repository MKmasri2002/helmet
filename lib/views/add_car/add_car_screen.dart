import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/add_car/add_car_controller.dart';
import 'package:helmet_customer/views/add_car/widget/choose_brand_car.dart';
import 'package:helmet_customer/views/add_car/widget/choose_model_car.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';
import 'package:helmet_customer/widget/text_field.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Add Car'),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: GestureDetector(
          onTap: ()=> FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Choose Your Brand',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => appTools.showCustomBottomSheet(
                        context, const ChooseBrandCar(), true),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.5),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ctrl.selectedBrand),
                          const Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Choose Your Model',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      if (ctrl.carType.isEmpty) {
                        return;
                      }
                      appTools.showCustomBottomSheet(
                          context, const ChooseModelCar(), true);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.5),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ctrl.selectedModel),
                          const Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Car Plate Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  MainTextField(
                    controller: ctrl.plateNumberController,
                    hint: 'Enter your car plate number',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Car Color',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 55,
                    child: ListView.builder(
                      itemCount: ctrl.carColorMap.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            ctrl.selectedColor = ctrl.carColorMap[index]['hex'];
                            ctrl.selectedColorHex = ctrl.carColorMap[index]['color_code'];
                            ctrl.update();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: ctrl.carColorMap[index]['hex'],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ctrl.selectedColor ==
                                        ctrl.carColorMap[index]['hex']
                                    ? AppColors.primary
                                    : Colors.grey.withValues(alpha: 0.5),
                                width: 2,
                              ),
                            ),
                            child:
                                ctrl.selectedColor == ctrl.carColorMap[index]['hex']
                                    ? Icon(
                                        Icons.check,
                                        color: ctrl.selectedColor ==
                                                const Color(0xFFFFFFFF)
                                            ? AppColors.primary
                                            : Colors.white,
                                      )
                                    : null,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    onTap: () => ctrl.addCar(context),
                    title: 'Add Car',
                    ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
