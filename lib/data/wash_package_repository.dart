import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/wash_models/package_model.dart';

class WashPackageRepository {
  static Future<List<PackageModel>> getAllWashPackage() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref("packages").get();

    if (snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);
        final List<PackageModel> packages = data.entries.map((entry) {
          final package =
              PackageModel.fromJson(Map<String, dynamic>.from(entry.value));
          return package;
        }).toList();

        return packages;
      } catch (e) {}
    }

    return [];
  }

  //////////////////////////////////////////////
  static Future<List<PackageModel>> getAllPackage() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("package").get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<PackageModel> packages = querySnapshot.docs.map((doc) {
          return PackageModel.fromJson(doc.data());
        }).toList();
        return packages;
      }
    } catch (e) {
      log("Error loading full user info: $e");
      return [];
    }
    return [];
  }
}
