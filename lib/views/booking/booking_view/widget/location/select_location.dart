import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/views/address/address_book_binding.dart';
import 'package:helmet_customer/views/address/address_book_view.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(Icons.location_on, color: primaryColor, size: 30),
            TextButton(
              onPressed: () async {
                await Get.to(() => const AddressBookView(),
                    binding: AddressBookBinding());
                // move camera to the selected address
                if (ctrl.mapController != null) {
                  ctrl.mapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(currentAddress.value.latitude!,
                            currentAddress.value.longitude!),
                        zoom: 14,
                      ),
                    ),
                  );
                }
                ctrl.update();
              },
              child: CustomText(
                text: currentAddress.value.address ?? "",
                fontSize: 7, //14
                fontWeight: FontWeight.bold,
                maxLines: 5,
              ),
            ),
          ],
        ),
      );
    });
  }
}
