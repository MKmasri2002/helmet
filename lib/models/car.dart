class Car {
  String? id;
  String? brand;
  String? color;
  String? model;
  String? plateNumber;
  String? image;

  Car({this.id, this.brand, this.color, this.model, this.plateNumber,this.image});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    color = json['color'];
    model = json['model'];
    plateNumber = json['plate_number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    data['color'] = color;
    data['model'] = model;
    data['plate_number'] = plateNumber;
    data['image'] = image;
    return data;
  }

  @override
  String toString() {
    return "$brand";
  }
}
