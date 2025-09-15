import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';

class BookingMap extends StatelessWidget {
  const BookingMap({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<BookingController>(builder: (ctrl) {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(currentAddress.value.latitude!,
                currentAddress.value.longitude!),
            zoom: 14,
          ),
          markers: {
            Marker(
                markerId: const MarkerId("1"),
                position: LatLng(currentAddress.value.latitude!,
                    currentAddress.value.longitude!))
          },
          myLocationEnabled: false,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            ctrl.mapController = controller;
            // move camera to the selected address
            if (currentAddress.value.latitude != null &&
                currentAddress.value.longitude != null) {
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
          },
        ),
      );
    });
  }
}
