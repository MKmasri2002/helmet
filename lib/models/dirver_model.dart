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
  String? licensePlate;
  double? rating;
  int? totalWashes;
  String? status; // 'Active', 'Suspended', 'Off-Duty'
  String? suspensionStart;
  String? suspensionEnd;
  Map<String, dynamic>? assignedArea; // {areaId: 'z1', name: 'Downtown'}
  Map<String, dynamic>? schedule; // Weekly schedule

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
    this.licensePlate,
    this.rating,
    this.totalWashes,
    this.status,
    this.suspensionStart,
    this.suspensionEnd,
    this.assignedArea,
    this.schedule,
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
    licensePlate = json['licensePlate'];
    rating = (json['rating'] as num?)?.toDouble() ?? 5.0;
    totalWashes = json['totalWashes'] ?? 0;
    status = json['status'] ?? 'Active';
    suspensionStart = json['suspensionStart'];
    suspensionEnd = json['suspensionEnd'];
    assignedArea = json['assignedArea'];
    schedule = json['schedule'];
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
    data['licensePlate'] = licensePlate;
    data['rating'] = rating;
    data['totalWashes'] = totalWashes;
    data['status'] = status;
    data['suspensionStart'] = suspensionStart;
    data['suspensionEnd'] = suspensionEnd;
    data['assignedArea'] = assignedArea;
    data['schedule'] = schedule;
    return data;
  }
}
