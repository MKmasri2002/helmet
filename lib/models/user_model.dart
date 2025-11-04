import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? birthdate;

  String? userType;
  List<String>? ongoingReservations;
  List<String>? completedReservations;
  List<Address> addresses = [];
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
    this.birthdate,
  }) {
    getAddresses();
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    accountStatus = json['accountStatus'];
    coins = json['coins'];
    email = json['email'];
    gender = json['gender'];
    image = json['image'];
    invitedBy = json['invitedBy'];
    lastLoginDate = json['lastLoginDate'];

    name = json['name'];
    birthdate = json['birthdate'];

    password = json['password'];
    phone = json['phone'];
    referralCode = json['referralCode'];
    registerDate = json['registerDate']?.toString();
    token = json['token'];
    uid = json['uid'];
    userType = json['userType'];
    cars = json['cars'] != null
        ? List<Car>.from(json['cars'].map((x) => Car.fromJson(x)))
        : [];
    getAddresses();
    getCars();
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
    data['birthdate'] = birthdate;

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
    birthdate: $birthdate,

  phone: $phone,
  referralCode: $referralCode,
  registerDate: $registerDate,
  token: $token,
  uid: $uid,
  userType: $userType,
  ongoingReservations: $ongoingReservations,
  completedReservations: $completedReservations,

  

)
''';
  }

  Future<void> getAddresses() async {
    final query = await FirebaseFirestore.instance
        .collection('address')
        .where('user_id', isEqualTo: uid)
        .get();
    if (query.docs.isNotEmpty) {
      addresses =
          query.docs.map((doc) => Address.fromJson(doc.data())).toList();
    }
  }

  Future<void> getCars() async {
    final query = await FirebaseFirestore.instance
        .collection('car')
        .where('user_id', isEqualTo: uid)
        .get();
    if (query.docs.isNotEmpty) {
      cars = query.docs.map((doc) => Car.fromJson(doc.data())).toList();
    }
  }
}

class Address {
  String? address;
  String? areaId;
  bool? defaultLocation;
  String? id;
  String? userId;
  double? latitude;
  double? longitude;
  String? title;

  Address(
      {this.address,
      this.userId,
      this.areaId,
      this.defaultLocation,
      this.id,
      this.latitude,
      this.longitude,
      this.title});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    areaId = json['areaId'];
    defaultLocation = json['defaultLocation'];
    id = json['id'];
    userId = json['user_id'];
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
    data['user_id'] = userId;
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
