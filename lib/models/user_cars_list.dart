class UserCarsList {
  String? plateNumber;
  String? brand;
  String? model;
  String? color;
  String? image;

  UserCarsList({this.plateNumber, this.brand, this.model, this.color, this.image});

  UserCarsList.fromJson(Map<String, dynamic> json) {
    plateNumber = json['plate_number'];
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plate_number'] = plateNumber;
    data['brand'] = brand;
    data['model'] = model;
    data['color'] = color;
    data['image'] = image;
    return data;
  }
}
