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

  
}
