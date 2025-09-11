import 'package:google_maps_flutter/google_maps_flutter.dart';

class AreaModel {
  String? id;
  String? name;
  List<LatLng>? location;
  AreaModel({this.id, this.name, this.location});

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] as String,
      name: json['name'] as String,
      location:
          (json['location'] as List<dynamic>?)
              ?.map(
                (e) =>
                    LatLng(e['latitude'] as double, e['longitude'] as double),
              )
              .toList(),
    );
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