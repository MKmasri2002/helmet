class DriverModel {
  String? email;
  String? name;
  String? id;
  String? imageUrl;
  bool? isActive;
  bool? isOnline;
  String? notificationToken;
  String? phoneNumber;
  bool? enableNotification;
  List<String>? orders = [];
  String? areaId;

  DriverModel({
    this.email,
    this.name,
    this.id,
    this.imageUrl,
    this.isActive,
    this.isOnline,
    this.notificationToken,
    this.phoneNumber,
    this.enableNotification,
    this.orders,
    this.areaId,
  });

  DriverModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    isActive = json['isActive'];
    isOnline = json['isOnline'];
    notificationToken = json['notificationToken'];
    phoneNumber = json['phone'];
    enableNotification = json['enableNotification'];
    // orders = json["orders"] == null ? [] : List<String>.from(json["orders"]!.map((x) => x));
    areaId = json['areaId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['isActive'] = isActive;
    data['isOnline'] = isOnline;
    data['notificationToken'] = notificationToken;
    data['phone'] = phoneNumber;
    data['enableNotification'] = enableNotification;
    data['orders'] = orders;
    data['areaId'] = areaId;
    return data;
  }
}
