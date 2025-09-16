import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/utils/colors/color1.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:helmet_customer/views/order_status/order_status_controller.dart';
import 'package:helmet_customer/views/widget/custom_text.dart';

class Component9 extends StatelessWidget {
  const Component9({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(builder: (ctrl) {
      return Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: BoxBorder.all(
                        color: Colors.black,
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
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
                                  position: LatLng(
                                      washDataTripModel.userLat ?? 0,
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
                                      target: LatLng(
                                          washDataTripModel.userLat ?? 0,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Icon(Icons.location_on,
                                color: primaryColor, size: 30),
                            CustomText(
                              text: userModel.userAddresses![0].address ?? "",
                              fontSize: 7, //14
                              fontWeight: FontWeight.bold,
                              maxLines: 5,
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
