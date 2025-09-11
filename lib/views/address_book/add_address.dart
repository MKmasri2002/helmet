import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/address_book/address_book_controller.dart';
import 'package:helmet_customer/widget/primary_button/primary_button.dart';
import 'package:helmet_customer/widget/text/headline4.dart';
import 'package:helmet_customer/widget/text/headline5.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressBookController>(
      builder: (ctrl) {
        return Scaffold(
          body: PlacePicker(
            apiKey: Platform.isAndroid
                ? 'AIzaSyB10bUvev3cL3COPb2EQwiEOVb7jRTszgo'
                : 'AIzaSyAoT0RPXXjgDJUnX0exr6JiFU1OyDEy1Ak',
            initialPosition: LatLng(
              currentAddress.value.latitude!,
              currentAddress.value.longitude!,
            ),
            hintText: "Find a place",
            searchingText: "Please wait ...",
            selectText: "Select place",
            outsideOfPickAreaText: "Place not in area",
            useCurrentLocation: true,
            selectInitialPosition: true,
            usePinPointingSearch: true,
            usePlaceDetailSearch: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            ignoreLocationPermissionErrors: true,
            region: 'JO',
            onPlacePicked: (PickResult result) {
              log(result.name!);
            },
            selectedPlaceWidgetBuilder:
                (context, selectedPlace, state, isSearchBarFocused) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.only(
                    bottom: 60,
                    left: MediaQuery.sizeOf(context).width * 0.1,
                    right: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: isSearchBarFocused
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : selectedPlace != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Headline4(
                                  title: 'Selected place',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ListTile(
                                  leading: const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.primary,
                                    child: Icon(
                                      Icons.location_pin,
                                      color: AppColors.white,
                                      size: 17,
                                    ),
                                  ),
                                  title: Headline5(
                                    title: selectedPlace.name ?? '',
                                  ),
                                  subtitle: Headline5(
                                      title: selectedPlace.vicinity ?? ''),
                                ),
                                const Spacer(),
                                PrimaryButton(
                                  onTap: () {
                                    log(selectedPlace.geometry!.location.lat
                                        .toString());
                                    log(selectedPlace.placeId.toString());
                                    appTools.showAlertDialogTwoFun(
                                      context,
                                      title: 'Add location',
                                      content:
                                          'Do you want to set this address as a default address',
                                      yes: () {
                                        log(selectedPlace.geometry!.location.lat
                                            .toString());
                                        log(selectedPlace.placeId.toString());
                                        ctrl.addLocation(
                                          pickResult: selectedPlace,
                                          defaultLocation: true,
                                        );
                                      },
                                      no: () {
                                        ctrl.addLocation(
                                            pickResult: selectedPlace,
                                            defaultLocation: false);
                                      },
                                    );
                                 
                                  },
                                  title: 'Submit',
                                )
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
