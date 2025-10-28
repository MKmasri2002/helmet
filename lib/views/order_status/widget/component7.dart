import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component7 extends StatelessWidget {
  const Component7({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          shrinkWrap: true, // مهم جداً عشان داخل Column/ScrollView
          physics:
              const NeverScrollableScrollPhysics(), // عشان ScrollView الرئيسي يتعامل مع السحب
          itemCount: ctrl.currentOrder?.cars.length,
          itemBuilder: (context, index) {
            final car = ctrl.currentOrder?.cars[index];
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: car?.image != null
                    ? Image.network(
                        car!.image!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.car_repair,
                                size: 40, color: Colors.grey),
                      )
                    : const Icon(Icons.directions_car,
                        size: 40, color: Colors.grey),
                title: Text(car?.brand ?? "Car"),
                trailing: const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 10,
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
