import 'package:helmet_customer/models/wash_models/wash_session.dart';

class Order {
  int? washCount;
  int? remain;
  String? washType;
  double? washPrice;
  String? washTitleEn;
  String? washTitleAr;
  String? userId;
  bool? isPaid = false;
  String? id;
  String? createdAt;
  List<WashSession> sessions = [];
  String? endDate;

  Order({
    this.washCount,
    this.washType,
    this.washPrice,
    this.washTitleEn,
    this.washTitleAr,
    this.id,
    this.createdAt,
    this.userId,
    this.isPaid,
    this.endDate,
  }) {
    remain = washCount;
  }

  Order.fromJson(Map<String, dynamic> json) {
    washCount = json['washCount'];
    remain = json['remain'];
    washType = json['washType'];
    washPrice = json['washPrice'];
    endDate = json['washTimeDate'];
    washTitleEn = json['washTitleEn'];
    washTitleAr = json['washTitleAr'];
    id = json['id'];
    createdAt = json['createdAt'];
    userId = json['userId'];
    isPaid = json['isPaid'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['washCount'] = washCount;
    data['remain'] = remain;
    data['washType'] = washType;
    data['washPrice'] = washPrice;
    data['washTimeDate'] = endDate;
    data['washTitleEn'] = washTitleEn;
    data['washTitleAr'] = washTitleAr;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['userId'] = userId;
    data['isPaid'] = isPaid;

    return data;
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('WashDataTripModel {');
    sb.writeln('  washCount: $washCount');
    sb.writeln('  washType: $washType');
    sb.writeln('  washPrice: $washPrice');
    sb.writeln('  washTimeDate: $endDate');
    sb.writeln('  washTitleEn: $washTitleEn');
    sb.writeln('  id: $id');
    sb.writeln('  userId: $userId');
    sb.writeln('  createdAt: $createdAt');
    sb.writeln('  is paid : $isPaid');
    sb.writeln('  sessions: ');
    for (WashSession w in sessions) {
      sb.writeln('  ${w.toString()}');
    }
    sb.writeln('  car l : $isPaid');
    sb.writeln('}');
    return sb.toString();
  }

  void decrementWashCount() {
    if (remain != null && remain! > 0) {
      remain = remain! - 1;
    }
  }
}
