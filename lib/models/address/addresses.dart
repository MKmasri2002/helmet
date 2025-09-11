class AddressModel {
  String? id;
  String? address;
  String? addressType;
  String? contactPersonName;
  String? contactPersonNumber;
  String? floor;
  String? house;
  double? latitude;
  double? longitude;
  String? title;
  String? areaId;
  bool? defaultLocation;

  AddressModel({
    this.id,
    this.address,
    this.addressType,
    this.contactPersonName,
    this.contactPersonNumber,
    this.floor,
    this.house,
    this.latitude,
    this.title,
    this.longitude,
    this.defaultLocation,
    this.areaId,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    addressType = json['addressType'];
    contactPersonName = json['contactPersonName'];
    contactPersonNumber = json['contactPersonNumber'];
    floor = json['floor'];
    house = json['house'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    title = json['title'];
    defaultLocation = json['defaultLocation'];
    areaId = json['areaId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['addressType'] = addressType;
    data['contactPersonName'] = contactPersonName;
    data['contactPersonNumber'] = contactPersonNumber;
    data['floor'] = floor;
    data['house'] = house;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['title'] = title;
    data['defaultLocation'] = defaultLocation;
    data['areaId'] = areaId;
    return data;
  }
}
