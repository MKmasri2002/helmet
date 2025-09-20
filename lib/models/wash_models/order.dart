import 'package:helmet_customer/models/car.dart';
import 'package:helmet_customer/models/payment.dart';

class Order {
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
  String? userId;
  String? driverId;
  List<Car> cars = [];
  Payment? payment;
  String? id;
  String? createdAt;
  String? areaId;

  Order({
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
    this.driverId,
    this.payment,
    this.id,
    this.createdAt,
    this.areaId,
    this.userId,
  });
  DateTime? get dateTime {
    if (washTimeDate != null) {
      try {
        return DateTime.parse(washTimeDate!);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Duration? get remainingTime {
    if (dateTime == null) return null;
    final now = DateTime.now();
    if (dateTime!.isBefore(now)) return Duration.zero;
    return dateTime!.difference(now);
  }

  Order.fromJson(Map<String, dynamic> json) {
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
    driverId = json['driverId'];
    id = json['id'];
    createdAt = json['createdAt'];
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
    data['driverId'] = driverId;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['washTime'] = washTimeDay;
    data['areaId'] = areaId;
    data['userId'] = userId;

    return data;
  }


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
    sb.writeln('  car: ${cars.length}');
    sb.writeln('  id: $id');
    sb.writeln('  userId: $userId');
    sb.writeln('  driverId: $driverId');
    sb.writeln('  createdAt: $createdAt');
    sb.writeln('  areaId: $areaId');
    sb.writeln('}');
    return sb.toString();
  }
}
