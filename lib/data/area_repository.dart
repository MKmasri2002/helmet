import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/area/area_model.dart';

class AreaRepository {
  static final DatabaseReference _collectionReference =
      FirebaseDatabase.instance.ref("areas");
  static Future<List<Area>> getAllAreas() async {
    DataSnapshot snapshot = await _collectionReference.get();
    if (snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);
        final List<Area> areas = data.entries.map((entry) {
          final Area area =
              Area.fromJson(Map<String, dynamic>.from(entry.value));
          return area;
        }).toList();
        return areas;
      } catch (e) {
        
      }
    }
    return [];
  }
}
