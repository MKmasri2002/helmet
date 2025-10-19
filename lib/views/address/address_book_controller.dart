import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:helmet_customer/models/address/addresses.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:helmet_customer/views/home/home_controller.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as maps_toolkit;

class AddressBookController extends GetxController {
  LatLng newLocation = const LatLng(0, 0);
  final String addressTag = 'UserAddresses';
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Users");
  List<AddressModel> addressList = [];
  @override
  void onInit() async {
    //await Permission.location.request();
    super.onInit();
  }

  Future<void> addLocation({
    required PickResult pickResult,
    required bool defaultLocation,
  }) async {
    AddressModel addressModel = AddressModel(
      latitude: pickResult.geometry!.location.lat,
      longitude: pickResult.geometry!.location.lng,
      address: pickResult.formattedAddress,
      title: pickResult.name,
      id: (addressList.length + 1).toString(),
      defaultLocation: defaultLocation,
    );

    if (defaultLocation) {
      currentAddress.value = addressModel;
      currentAddress.value.defaultLocation = true;
      log('Address added: ${addressModel.toJson()}');
    }
    bool isInArea = false;

    for (var address in areasList) {
      List<maps_toolkit.LatLng> location = [];
      location.clear();
      for (var data in address.location!) {
        location.add(maps_toolkit.LatLng(data.latitude, data.longitude));
      }
      isInArea = maps_toolkit.PolygonUtil.containsLocation(
          maps_toolkit.LatLng(
              currentAddress.value.latitude!, currentAddress.value.longitude!),
          location,
          false);
      if (isInArea) {
        currentAddress.value.areaId = address.id;
        addressModel.areaId = address.id;
        break;
      }
    }
    await Future.delayed(const Duration(seconds: 1));
    databaseReference
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(addressTag)
        .push()
        .set(addressModel.toJson());
    getCurrentPosition();
    update();
    Get.back();
    Get.back();
  }

  // I need to set the default location to the new location

  void changeDefaultLocation({
    required AddressModel addressModel,
  }) async {
    currentAddress.value.defaultLocation = false;
    databaseReference
        .child(userModel.uid!)
        .child(addressTag)
        .child(currentAddress.value.id!)
        .set(currentAddress.value.toJson());
    currentAddress.value = addressModel;
    currentAddress.value.defaultLocation = true;
    databaseReference
        .child(userModel.uid!)
        .child(addressTag)
        .child(currentAddress.value.id!)
        .set(currentAddress.value.toJson());
    update();
    Get.appUpdate();
  }

  void setDefaultLocation({
    required AddressModel addressModel,
    required BuildContext context,
  }) async {
    appTools.showAlertDialogTwoFun(
      context,
      title: 'Add location',
      content: 'Do you want to set this address as a default address',
      yes: () {
        changeDefaultLocation(addressModel: addressModel);
        Get.back();
      },
      no: () {
        Get.back();
      },
    );
  }

  Future<void> getCurrentPosition() async {
    if(FirebaseAuth.instance.currentUser == null) {
      return;
    }
    userModel.uid = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      DataSnapshot snapshot =
          await databaseReference.child(userModel.uid!).child(addressTag).get();
      if (!snapshot.exists) {
        log("empty address");
        return;
      }
      addressList.clear();
      Map<String, dynamic> data = jsonDecode(jsonEncode(snapshot.value));
      for (var key in data.keys) {
        AddressModel addressModel = AddressModel.fromJson(data[key]);
        addressList.add(addressModel);
        if (addressModel.defaultLocation!) {
          currentAddress.value = addressModel;
          update();
          break;
        }
      }
    } catch (e) {
      log('Error fetching users Data: $e');
    }
  }
}
