import 'package:helmet_customer/models/car.dart';
import 'package:intl/intl.dart';

class Order {
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
  Order({
    this.areaId,
    this.driverId,
    this.washTime,
    this.status,
    this.id,
    this.user_id,
    this.price,
    this.titleAr,
    this.titleEn,
  });
  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    areaId = json['areaId'];
    driverId = json['driverId'];
    washTime = json['washTime'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': id,
      'user_id': user_id,
      'areaId': areaId,
      'driverId': driverId,
      'washTime': washTime,
      'status': status,
    };
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
