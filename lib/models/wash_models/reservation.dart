class Subscribe {
  String? id;
  String? nameAr;
  String? nameEn;
  int? washCount;
  String? endDate;
  String? userId;

  Subscribe({this.id, this.nameAr, this.nameEn, this.washCount,this.endDate, this.userId});
  Subscribe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    washCount = json['washCount'];
    userId = json['userId'];
    endDate = json['endDate'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameAr'] = nameAr;
    data['nameEn'] = nameEn;
    data['washCount'] = washCount;
    data['userId'] = userId;
    data['endDate'] = endDate;
    return data;
  }
}
