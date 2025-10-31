import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:helmet_customer/models/address/addresses.dart';
import 'package:helmet_customer/models/area/area_model.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/utils/constants.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/utils/tools/tools.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as maps_toolkit;

class AddressBookController extends GetxController {
  LatLng newLocation = const LatLng(0, 0);
  final String addressTag = 'UserAddresses';
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Users");
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
    final docRef = firebaseFirestore.collection('address').doc();
    Address address = Address(
      latitude: pickResult.geometry!.location.lat,
      longitude: pickResult.geometry!.location.lng,
      address: pickResult.formattedAddress,
      title: pickResult.name,
      id: docRef.id,
      userId: userModel.uid.toString(),
      defaultLocation: defaultLocation,
    );

    // if (defaultLocation) {
    //   currentAddress.value = addressModel;
    //   currentAddress.value.defaultLocation = true;
    //   log('Address added: ${addressModel.toJson()}');
    // }
    bool isInArea = false;

    for (AreaModel area in areas) {
      List<maps_toolkit.LatLng> locations = [];

      for (var loc in area.location!) {
        locations.add(maps_toolkit.LatLng(loc.latitude, loc.longitude));
      }
      isInArea = maps_toolkit.PolygonUtil.containsLocation(
          maps_toolkit.LatLng(address.latitude!, address.longitude!),
          locations,
          false);
      if (isInArea) {
        currentAddress.value.areaId = area.id;
        address.areaId = area.id;
        break;
      }
    }
    if (!isInArea) {
      Get.back();
      Get.snackbar(
        'Error',
        'This address is out of our service area',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    docRef.set(address.toJson());
    userModel.addresses.add(address);
    //firebaseFirestore.collection('address').add(address.toJson());
    getCurrentPosition();
    update();
    Get.back();
    Get.back();
  }

  // I need to set the default location to the new location

  void changeDefaultLocation({
    required Address address,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final addressRef =
        firestore.collection('address').where('id', isEqualTo: userModel.uid);
  }

  void setDefaultLocation({
    required Address address,
    required BuildContext context,
  }) async {
    appTools.showAlertDialogTwoFun(
      context,
      title: 'Add location',
      content: 'Do you want to set this address as a default address',
      yes: () {
        changeDefaultLocation(address: address);
        Get.back();
      },
      no: () {
        Get.back();
      },
    );
  }

  Future<void> getCurrentPosition() async {
    if (FirebaseAuth.instance.currentUser == null) {
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
