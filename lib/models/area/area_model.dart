import 'package:google_maps_flutter/google_maps_flutter.dart';

class AreaModel {
  String? id;
  String? name;
  List<LatLng>? coordinates;
  AreaModel({this.id, this.name, this.coordinates});

  AreaModel.fromJson(Map<String, dynamic> json) {
    
      id = json['id'];
      name = json['name'];
      if(json['coordinates'] != null)
      {
        coordinates = (json['coordinates'] as List<dynamic>)
            .map(
              (e) => LatLng(e['latitude'] as double, e['longitude'] as double),
            )
            .toList();
      }else{
        coordinates = [];
      }          
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coordinates':
          coordinates?.map((e) {
            return {'latitude': e.latitude, 'longitude': e.longitude};
          }).toList(),
    };
  }
}