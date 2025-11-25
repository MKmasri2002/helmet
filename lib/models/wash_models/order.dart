import 'package:helmet_customer/models/car.dart';
import 'package:intl/intl.dart';

class OrderModel {
  String? id;
  String? user_id;
  String? areaId;
  String? driverId;
  List<Car> cars = [];
  String? washTime;
  String? status;
  double? price;
  String? titleAr;
  String? titleEn;
  String? type;
  String? location; // Customer location/address
  String? customerName; // For booking compatibility
  String? serviceType; // Additional service type info
  OrderModel({
    this.areaId,
    this.driverId,
    this.washTime,
    this.status,
    this.id,
    this.user_id,
    this.price,
    this.titleAr,
    this.titleEn,
    this.type,
    this.location,
    this.customerName,
    this.serviceType,
  });
  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    areaId = json['areaId'];
    driverId = json['driverId'];
    washTime = json['washTime'];
    status = json['status'];
    price = json['price']?.toDouble();
    titleAr = json['titleAr'];
    titleEn = json['titleEn'];
    type = json['type'];
    location = json['location'];
    customerName = json['customerName'];
    serviceType = json['serviceType'];
     if (json['cars'] != null) {
    cars = List<Car>.from(json['cars'].map((x) => Car.fromJson(x)));
  }

  }
  Map<String, dynamic> toJson() {
    final  Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['areaId'] = areaId;
    data['driverId'] = driverId;
    data['washTime'] = washTime;
    data['status'] = status;
    data['price'] = price;
    data['titleAr'] = titleAr;
    data['titleEn'] = titleEn;
    data['type'] = type;
    data['location'] = location;
    data['customerName'] = customerName;
    data['serviceType'] = serviceType;
    data['cars'] = cars.map((x) => x.toJson()).toList();
    return data;
  }

  String get formattedWashTime {
    if (washTime == null) return '';
    try {
      final dateTime = DateTime.parse(washTime!);
      print(
          'formattedWashTime: ${DateFormat('yyyy-MM-dd hh:mm a').format(dateTime)}');
      return DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
    } catch (e) {
      return washTime!;
    }
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('wash session {');
    sb.writeln('  Id: $id');
    sb.writeln('  areaId: $areaId');
    sb.writeln('  driverId: $driverId');
    sb.writeln('  washTime: $washTime');
    sb.writeln('  status: $status');
    sb.writeln('  cars: ');
    for (Car w in cars) {
      sb.writeln('  ${w.toString()}');
    }
    sb.writeln('}');
    return sb.toString();
  }
}
