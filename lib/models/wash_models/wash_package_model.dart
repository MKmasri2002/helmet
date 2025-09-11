// class WashPackageModel {
//   List<OneTimePackages>? oneTimePackages;
//   List<OneTimePackages>? subscriptionPackages;

//   WashPackageModel({this.oneTimePackages, this.subscriptionPackages});

//   WashPackageModel.fromJson(Map<String, dynamic> json) {
//     if (json['oneTimePackages'] != null) {
//       oneTimePackages = <OneTimePackages>[];
//       json['oneTimePackages'].forEach((v) {
//         oneTimePackages!.add(OneTimePackages.fromJson(v));
//       });
//     }
//     if (json['subscriptionPackages'] != null) {
//       subscriptionPackages = <OneTimePackages>[];
//       json['subscriptionPackages'].forEach((v) {
//         subscriptionPackages!.add(OneTimePackages.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (oneTimePackages != null) {
//       data['oneTimePackages'] =
//           oneTimePackages!.map((v) => v.toJson()).toList();
//     }
//     if (subscriptionPackages != null) {
//       data['subscriptionPackages'] =
//           subscriptionPackages!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class OneTimePackages {
//   String? nameAr;
//   String? descriptionAr;
//   String? nameEn;
//   String? descriptionEn;
//   double? price;
//   double? salePrice;
//   bool? sale;
//   int? percentage;
//   String? type;
//   int? count;
//   String? currency;
//   String? id;
//   String? image;
//   String? endDate;
//   bool? showInAdds;

//   OneTimePackages({
//     this.nameAr,
//     this.descriptionAr,
//     this.nameEn,
//     this.descriptionEn,
//     this.price,
//     this.salePrice,
//     this.sale,
//     this.percentage,
//     this.type,
//     this.count,
//     this.currency,
//     this.id,
//     this.image,
//     this.endDate,
//     this.showInAdds,
//   });

//   OneTimePackages.fromJson(Map<String, dynamic> json) {
//     nameAr = json['nameAr'];
//     descriptionAr = json['descriptionAr'];
//     nameEn = json['nameEn'];
//     descriptionEn = json['descriptionEn'];
//     price = json['price'];
//     salePrice = json['salePrice'];
//     sale = json['sale'];
//     percentage = json['percentage'];
//     type = json['type'];
//     count = json['count'];
//     currency = json['currency'];
//     id = json['id'];
//     image = json['image'];
//     endDate = json['endDate'];
//     showInAdds = json['showInAdds'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nameAr'] = nameAr;
//     data['descriptionAr'] = descriptionAr;
//     data['nameEn'] = nameEn;
//     data['descriptionEn'] = descriptionEn;
//     data['price'] = price;
//     data['salePrice'] = salePrice;
//     data['sale'] = sale;
//     data['percentage'] = percentage;
//     data['type'] = type;
//     data['count'] = count;
//     data['currency'] = currency;
//     data['id'] = id;
//     data['image'] = image;
//     data['endDate'] = endDate;
//     data['showInAdds'] = showInAdds;
//     return data;
//   }
// }
