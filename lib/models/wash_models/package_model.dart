class PackageModel {
  final bool? active;
  final int? count;
  final String? currency;
  final String? currencySymbol;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? endDate;
  final String? id;
  final String? image;
  final String? nameAr;
  final String? nameEn;
  final double? percentage;
  final double? price;
  final bool? sale;
  final double? salePrice;
  final bool? showInAdds;
  final String? type;
  final String? imageAdds;
  PackageModel({
    this.active,
    this.count,
    this.currency,
    this.currencySymbol,
    this.descriptionAr,
    this.descriptionEn,
    this.endDate,
    this.id,
    this.image,
    this.nameAr,
    this.nameEn,
    this.percentage,
    this.price,
    this.sale,
    this.salePrice,
    this.showInAdds,
    this.type,
    this.imageAdds,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      active: json['active'] ?? true,
      count: json['count'] ?? 0,
      currency: json['currency'] ?? 'SAR',
      currencySymbol: json['currencySymbol'] ?? 'SR',
      descriptionAr: json['descriptionAr'] ?? '',
      descriptionEn: json['descriptionEn'] ?? '',
      endDate: json['endDate'] ?? '',
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      nameAr: json['nameAr'] ?? '',
      nameEn: json['nameEn'] ?? '',
      percentage: (json['percentage'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
      sale: json['sale'] ?? false,
      salePrice: (json['salePrice'] ?? 0).toDouble(),
      showInAdds: json['showInAdds'] ?? false,
      type: json['type'] ?? '',
      imageAdds: json['imageAdds'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'count': count,
      'currency': currency,
      'currencySymbol': currencySymbol,
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'endDate': endDate,
      'image': image,
      'imageAdds': imageAdds,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'percentage': percentage,
      'price': price,
      'sale': sale,
      'salePrice': salePrice,
      'showInAdds': showInAdds,
      'type': type,
    };
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('PackageModel {');
    sb.writeln('  active: $active');
    sb.writeln('  count: $count');
    sb.writeln('  currency: $currency');
    sb.writeln('  currencySymbol: $currencySymbol');
    sb.writeln('  descriptionAr: $descriptionAr');
    sb.writeln('  descriptionEn: $descriptionEn');
    sb.writeln('  endDate: $endDate');
    sb.writeln('  id: $id');
    sb.writeln('  image: $image');
    sb.writeln('  nameAr: $nameAr');
    sb.writeln('  nameEn: $nameEn');
    sb.writeln('  percentage: $percentage');
    sb.writeln('  price: $price');
    sb.writeln('  sale: $sale');
    sb.writeln('  salePrice: $salePrice');
    sb.writeln('  showInAdds: $showInAdds');
    sb.writeln('  type: $type');
    sb.writeln('  imageAdds: $imageAdds');
    sb.writeln('}');
    return sb.toString();
  }
}
