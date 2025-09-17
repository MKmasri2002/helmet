class WashItemsModel {
  String? id;
  String? nameEn;
  String? nameAr;
  String? descriptionAr;
  String? descriptionEn;
  num? price;
  String? image;

  WashItemsModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.image,
  });

  WashItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    descriptionAr = json['descriptionAr'];
    descriptionEn = json['descriptionEn'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameEn'] = nameEn;
    data['nameAr'] = nameAr;
    data['descriptionAr'] = descriptionAr;
    data['descriptionEn'] = descriptionEn;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
