import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/views/booking/booking_controller.dart';
import 'package:helmet_customer/views/home/home_controller.dart';

class BookingMap extends StatelessWidget {
  const BookingMap({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (ctrl) {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(userModel.Addresses[0].latitude!,
                userModel.Addresses[0].longitude!),
            zoom: 14,
          ),
          markers: {
            Marker(
                markerId: const MarkerId("1"),
                position: LatLng(userModel.Addresses[0].latitude!,
                    userModel.Addresses[0].longitude!))
          },
          myLocationEnabled: false,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            ctrl.mapController = controller;
            // move camera to the selected address
            if (userModel.Addresses[0].latitude != null &&
                userModel.Addresses[0].longitude != null) {
              ctrl.mapController!.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(userModel.Addresses[0].latitude!,
                        userModel.Addresses[0].longitude!),
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
