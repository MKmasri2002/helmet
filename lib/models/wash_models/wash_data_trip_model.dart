import 'package:helmet_customer/models/car.dart';

class WashDataTripModel {
  int? washCount;
  String? washCountDate;
  String? washStatus;
  String? washType;
  double? washPrice;
  String? washTimeDay;
  String? washTimeDate;
  String? washArea;
  String? washTitleEn;
  String? washTitleAr;
  String? userName;
  String? userPhone;
  String? userPhoto;
  double? userLat;
  double? userLng;
  List<Car> cars = [];
  // String? plateNumber;
  // String? carBrand;
  // String? carType;
  // String? colorCode;
  String? carImage;
  String? userAddress;
  String? driverName;
  String? driverPhone;
  String? driverPhoto;
  String? paymentMethod;
  String? paymentStatus;
  String? paymentDate;
  int? paymentAmount;
  String? paymentTransactionId;
  String? paymentToken;
  String? paymentId;
  String? paymentCard;
  String? paymentReceipt;
  String? paymentStatusMessage;
  String? id;
  String? userId;
  String? createdAt;
  String? areaId;

  WashDataTripModel({
    this.washCount,
    this.washCountDate,
    this.washStatus,
    this.washType,
    this.washPrice,
    this.washTimeDay,
    this.washTimeDate,
    this.washArea,
    this.washTitleEn,
    this.washTitleAr,
    this.userName,
    this.userPhone,
    this.userPhoto,
    this.userLat,
    this.userLng,
    this.userAddress,
    this.driverName,
    this.driverPhone,
    this.driverPhoto,
    this.paymentMethod,
    this.paymentStatus,
    this.paymentDate,
    this.paymentAmount,
    this.paymentTransactionId,
    this.paymentReceipt,
    this.paymentStatusMessage,
    // this.plateNumber,
    // this.carBrand,
    // this.carType,
    // this.colorCode,
    this.carImage,
    this.id,
    this.createdAt,
    this.paymentToken,
    this.paymentId,
    this.paymentCard,
    this.areaId,
    this.userId,
  });

  WashDataTripModel.fromJson(Map<String, dynamic> json) {
    washCount = json['washCount'];
    washCountDate = json['washCountDate'];
    washStatus = json['washStatus'];
    washType = json['washType'];
    washPrice = json['washPrice'];
    washTimeDay = json['washTime'];
    washTimeDate = json['washTimeDate'];
    washArea = json['washArea'];
    washTitleEn = json['washTitleEn'];
    washTitleAr = json['washTitleAr'];
    userName = json['userName'];
    userPhone = json['userPhone'];
    userPhoto = json['userPhoto'];
    userLat = json['userLat'];
    userLng = json['userLng'];
    userAddress = json['userAddress'];
    driverName = json['driverName'];
    driverPhone = json['driverPhone'];
    driverPhoto = json['driverPhoto'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    paymentDate = json['paymentDate'];
    paymentAmount = json['paymentAmount'];
    paymentTransactionId = json['paymentTransactionId'];
    paymentReceipt = json['paymentReceipt'];
    paymentStatusMessage = json['paymentStatusMessage'];
    if (json['cars'] != null) {
      cars = (json['cars'] as List)
          .map((e) => Car.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    // plateNumber = json['plateNumber'];
    // carBrand = json['carBrand'];
    // carType = json['carType'];
    // colorCode = json['colorCode'];
    carImage = json['carImage'];
    id = json['id'];
    createdAt = json['createdAt'];
    paymentToken = json['paymentToken'];
    paymentId = json['paymentId'];
    paymentCard = json['paymentCard'];
    washTimeDay = json['washTime'];
    areaId = json['areaId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['washCount'] = washCount;
    data['washCountDate'] = washCountDate;
    data['washStatus'] = washStatus;
    data['washType'] = washType;
    data['washPrice'] = washPrice;
    data['washTime'] = washTimeDay;
    data['washTimeDate'] = washTimeDate;
    data['washArea'] = washArea;
    data['washTitleEn'] = washTitleEn;
    data['washTitleAr'] = washTitleAr;
    data['userName'] = userName;
    data['userPhone'] = userPhone;
    data['userPhoto'] = userPhoto;
    data['userLat'] = userLat;
    data['userLng'] = userLng;
    data['userAddress'] = userAddress;
    data['driverName'] = driverName;
    data['driverPhone'] = driverPhone;
    data['driverPhoto'] = driverPhoto;
    data['paymentMethod'] = paymentMethod;
    data['paymentStatus'] = paymentStatus;
    data['paymentDate'] = paymentDate;
    data['paymentAmount'] = paymentAmount;
    data['paymentTransactionId'] = paymentTransactionId;
    data['paymentReceipt'] = paymentReceipt;
    data['paymentStatusMessage'] = paymentStatusMessage;
    if (cars.isNotEmpty) {
      data['cars'] = cars.map((e) => e.toJson()).toList();
    }
    // data['plateNumber'] = plateNumber;
    // data['carBrand'] = carBrand;
    // data['carType'] = carType;
    // data['colorCode'] = colorCode;
    data['carImage'] = carImage;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['paymentToken'] = paymentToken;
    data['paymentId'] = paymentId;
    data['paymentCard'] = paymentCard;
    data['washTime'] = washTimeDay;
    data['areaId'] = areaId;
    data['userId'] = userId;

    return data;
  }

  // Added toString() override for easier debugging and logging
  // Context: this replaces the previous single-line toString so each field prints on its own line
  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('WashDataTripModel {');
    sb.writeln('  washCount: $washCount');
    sb.writeln('  washCountDate: $washCountDate');
    sb.writeln('  washStatus: $washStatus');
    sb.writeln('  washType: $washType');
    sb.writeln('  washPrice: $washPrice');
    sb.writeln('  washTimeDay: $washTimeDay');
    sb.writeln('  washTimeDate: $washTimeDate');
    sb.writeln('  washArea: $washArea');
    sb.writeln('  washTitleEn: $washTitleEn');
    sb.writeln('  washTitleAr: $washTitleAr');
    sb.writeln('  userName: $userName');
    sb.writeln('  userPhone: $userPhone');
    sb.writeln('  userPhoto: $userPhoto');
    sb.writeln('  userLat: $userLat');
    sb.writeln('  userLng: $userLng');
    // sb.writeln('  plateNumber: $plateNumber');
    // sb.writeln('  carBrand: $carBrand');
    // sb.writeln('  carType: $carType');
     sb.writeln('  car: ${cars.length}');
    sb.writeln('  carImage: $carImage');
    sb.writeln('  userAddress: $userAddress');
    sb.writeln('  driverName: $driverName');
    sb.writeln('  driverPhone: $driverPhone');
    sb.writeln('  driverPhoto: $driverPhoto');
    sb.writeln('  paymentMethod: $paymentMethod');
    sb.writeln('  paymentStatus: $paymentStatus');
    sb.writeln('  paymentDate: $paymentDate');
    sb.writeln('  paymentAmount: $paymentAmount');
    sb.writeln('  paymentTransactionId: $paymentTransactionId');
    sb.writeln('  paymentToken: $paymentToken');
    sb.writeln('  paymentId: $paymentId');
    sb.writeln('  paymentCard: $paymentCard');
    sb.writeln('  paymentReceipt: $paymentReceipt');
    sb.writeln('  paymentStatusMessage: $paymentStatusMessage');
    sb.writeln('  id: $id');
    sb.writeln('  userId: $userId');
    sb.writeln('  createdAt: $createdAt');
    sb.writeln('  areaId: $areaId');
    sb.writeln('}');
    return sb.toString();
  }
}
