class Car {
  String? id;
  String? user_id;
  String? brand;
  String? color;
  String? model;
  String? plateNumber;
  String? image;

  Car(
      {this.id,
      this.user_id,
      this.brand,
      this.color,
      this.model,
      this.plateNumber,
      this.image});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    brand = json['brand'];
    color = json['color'];
    model = json['model'];
    plateNumber = json['plate_number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['brand'] = brand;
    data['color'] = color;
    data['model'] = model;
    data['plate_number'] = plateNumber;
    data['image'] = image;
    return data;
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('car {');
    sb.writeln('  id: $id');
    sb.writeln('  user_id: $user_id');
    sb.writeln('  brand: $brand');
    sb.writeln('  color: $color');
    sb.writeln('  model: $model');
    sb.writeln('  plateNumber: $plateNumber');
    sb.writeln('  image: $image');
    sb.writeln('}');
    return sb.toString();
  }
}
