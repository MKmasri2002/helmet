import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helmet_customer/models/area/area_model.dart';

class AreaRepository {
 
  static final CollectionReference reference =
      FirebaseFirestore.instance.collection('area');
  

  static Future<List<AreaModel>> getAllAreas() async {
    try {
      final querySnapshot = await reference.get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<AreaModel> areas = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id;
          return AreaModel.fromJson(data);
        }).toList();
        return areas;
      }
    } catch (e) {
      return [];
    }

    return [];
  }
}
