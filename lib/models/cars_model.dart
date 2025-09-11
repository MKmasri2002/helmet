class CarsModel {
  List<Cars>? cars;

  CarsModel({this.cars});

  CarsModel.fromJson(Map<String, dynamic> json) {
    if (json['cars'] != null) {
      cars = <Cars>[];
      json['cars'].forEach((v) {
        cars!.add(Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cars != null) {
      data['cars'] = cars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cars {
  String? brand;
  List<String>? models;

  Cars({this.brand, this.models});

  Cars.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    models = json['models'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['models'] = models;
    return data;
  }
}
