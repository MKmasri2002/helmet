import 'package:helmet_customer/models/car.dart';

class WashSession {
  String? id;
  String? areaId;
  String? driverId;
  List<Car> cars = [];
  String? timeDate;
  String? timeHour;
  String? status;
  WashSession({
    this.areaId,
    this.driverId,
    this.timeDate,
    this.timeHour,
    this.status,
  });
  WashSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaId = json['areaId'];
    driverId = json['driverId'];
    timeDate = json['timeDate'];
    timeHour = json['timeHour'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': id,
      'areaId': areaId,
      'driverId': driverId,
      'timeDate': timeDate,
      'timeHour': timeHour,
      'status': status,
    };
    return data;
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('wash session {');
    sb.writeln('  Id: $id');
    sb.writeln('  areaId: $areaId');
    sb.writeln('  driverId: $driverId');
    sb.writeln('  timeDate: $timeDate');
    sb.writeln('  timeHour: $timeHour');
    sb.writeln('  status: $status');
    sb.writeln('  cars: ');
    for (Car w in cars) {
      sb.writeln('  ${w.toString()}');
    }
    sb.writeln('}');
    return sb.toString();
  }
}
