class Subscribe {
  String? id;
  String? userId;
  bool? isPaid;
  String? count;
  int? remain;
  double? price;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? type;
  DateTime? date;        // تاريخ الاشتراك
  DateTime? expiryDate;  // تاريخ الانتهاء

  Subscribe({
    this.id,
    this.userId,
    this.isPaid,
    this.count,
    this.remain,
    this.price,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.type,
    this.date,
    this.expiryDate,
  });

  Subscribe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    isPaid = json['is_paid'];
    count = json['count'];
    remain = json['remain'];
    price = json['price']?.toDouble();
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    type = json['type'];
    date = json['date'] != null ? DateTime.parse(json['date']) : null;
    expiryDate = json['expiry_date'] != null ? DateTime.parse(json['expiry_date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['is_paid'] = isPaid;
    data['count'] = count;
    data['remain'] = remain;
    data['price'] = price;
    data['title_ar'] = titleAr;
    data['title_en'] = titleEn;
    data['description_ar'] = descriptionAr;
    data['description_en'] = descriptionEn;
    data['type'] = type;
    data['date'] = date?.toIso8601String();
    data['expiry_date'] = expiryDate?.toIso8601String();
    return data;
  }
}
