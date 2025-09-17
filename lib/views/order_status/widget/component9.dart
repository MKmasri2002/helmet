import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/generated/assets.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';

class Component9 extends StatelessWidget {
  const Component9({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.all(
              color: Color(0xffC3CCD3),
            )),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(washDataTripModel.userLat ?? 0,
                        washDataTripModel.userLng ?? 0),
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                        markerId: const MarkerId("1"),
                        position: LatLng(washDataTripModel.userLat ?? 0,
                            washDataTripModel.userLng ?? 0))
                  },
                  myLocationEnabled: false,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    ctrl.mapController = controller;
                    // move camera to the selected address
                    if (washDataTripModel.userLat != null &&
                        washDataTripModel.userLng != null) {
                      ctrl.mapController!.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(washDataTripModel.userLat ?? 0,
                                washDataTripModel.userLng ?? 0),
                            zoom: 14,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // static const String dateIcon = 'assets/svg/date-icon.svg';
                  SvgPicture.asset(
                    SvgAssets.homeIcon,
                    fit: BoxFit
                        .cover, // يحافظ على نسب الصورة ويملأ الـ Container
                    width: 24, // اختياري: عرض محدد
                    height: 24,

                    // اختياري: ارتفاع محدد
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    userModel.userAddresses![0].address ?? "",
                    style: const TextStyle(
                      fontFamily: 'IBMPlexSansArabic',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 25 / 14,
                      letterSpacing: 0,
                      color: Color(0xff121212),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
