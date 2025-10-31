import 'package:google_maps_flutter/google_maps_flutter.dart';

class AreaModel {
  String? id;
  String? name;
  List<LatLng>? location;
  AreaModel({this.id, this.name, this.location});

  AreaModel.fromJson(Map<String, dynamic> json) {
    
      id = json['id'];
      name = json['name'];
      if(json['location'] != null)
      {
        location = (json['location'] as List<dynamic>)
            .map(
              (e) => LatLng(e['latitude'] as double, e['longitude'] as double),
            )
            .toList();
      }else{
        location = [];
      }          
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location':
          location?.map((e) {
            return {'latitude': e.latitude, 'longitude': e.longitude};
          }).toList(),
    };
  }
}