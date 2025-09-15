import 'package:helmet_customer/models/car.dart';

class UserModel {
  String? accountStatus;
  int? coins;
  String? email;
  String? gender;
  String? image;
  String? invitedBy;
  int? lastLoginDate;
  String? name;
  String? password;
  String? phone;
  String? referralCode;
  String? registerDate;
  String? token;
  String? uid;
  String? userType;
  List<String>? ongoingReservations;
  List<String>? completedReservations;
  List<UserAddresses>? userAddresses;
  List<Car> cars = [];
  

  UserModel({
    this.accountStatus,
    this.coins,
    this.email,
    this.gender,
    this.image,
    this.invitedBy,
    this.lastLoginDate,
    this.name,
    this.password,
    this.phone,
    this.referralCode,
    this.registerDate,
    this.token,
    this.uid,
    this.userType,
    this.ongoingReservations,
    this.completedReservations,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    accountStatus = json['accountStatus'];
    coins = json['coins'];
    email = json['email'];
    gender = json['gender'];
    image = json['image'];
    invitedBy = json['invitedBy'];
    lastLoginDate = json['lastLoginDate'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    referralCode = json['referralCode'];
    registerDate = json['registerDate']?.toString();
    token = json['token'];
    uid = json['uid'];
    userType = json['userType'];
    ongoingReservations = json['ongoingReservations'] != null
        ? List<String>.from(json['ongoingReservations'])
        : [];
    completedReservations = json['completedReservations'] != null
        ? List<String>.from(json['completedReservations'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountStatus'] = accountStatus;
    data['coins'] = coins;
    data['email'] = email;
    data['gender'] = gender;
    data['image'] = image;
    data['invitedBy'] = invitedBy;
    data['lastLoginDate'] = lastLoginDate;
    data['name'] = name;
    data['password'] = password;
    data['phone'] = phone;
    data['referralCode'] = referralCode;
    data['registerDate'] = registerDate;
    data['token'] = token;
    data['uid'] = uid;
    data['userType'] = userType;
    data['ongoingReservations'] = ongoingReservations;
    data['completedReservations'] = completedReservations;
    return data;
  }

   @override
  String toString() {
    return '''
UserModel(
  accountStatus: $accountStatus,
  coins: $coins,
  email: $email,
  gender: $gender,
  image: $image,
  invitedBy: $invitedBy,
  lastLoginDate: $lastLoginDate,
  name: $name,
  password: $password,
  phone: $phone,
  referralCode: $referralCode,
  registerDate: $registerDate,
  token: $token,
  uid: $uid,
  userType: $userType,
  ongoingReservations: $ongoingReservations,
  completedReservations: $completedReservations,
  userAddresses: ${userAddresses![0].toString()},
  cars ${cars[0].toString()}
)
''';
  }
}

class UserAddresses {
  String? address;
  String? areaId;
  bool? defaultLocation;
  String? id;
  double? latitude;
  double? longitude;
  String? title;

  UserAddresses(
      {this.address,
      this.areaId,
      this.defaultLocation,
      this.id,
      this.latitude,
      this.longitude,
      this.title});

  UserAddresses.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    areaId = json['areaId'];
    defaultLocation = json['defaultLocation'];
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['areaId'] = areaId;
    data['defaultLocation'] = defaultLocation;
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['title'] = title;
    return data;
  }

  @override
  String toString() {
    return '''
UserAddresses(
  id: $id,
  title: $title,
  address: $address,
  areaId: $areaId,
  defaultLocation: $defaultLocation,
  latitude: $latitude,
  longitude: $longitude
)
''';
  }

}

