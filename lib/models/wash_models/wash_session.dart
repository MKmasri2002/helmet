import 'package:helmet_customer/models/car.dart';
import 'package:intl/intl.dart';

class WashSession {
  String? id;
  String? areaId;
  String? driverId;
  List<Car> cars = [];
  String? washTime;
  String? status;
  WashSession({
    this.areaId,
    this.driverId,
    this.washTime,
    this.status,
  });
  WashSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaId = json['areaId'];
    driverId = json['driverId'];
    washTime = json['washTime'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': id,
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
