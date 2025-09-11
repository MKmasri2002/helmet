class PackageModel {
  final int count;
  final String currency;
  final String descriptionAr;
  final String descriptionEn;
  final String endDate;
  final String id;
  final String image;
  final String nameAr;
  final String nameEn;
  final double percentage;
  final double price;
  final bool sale;
  final double salePrice;
  final bool showInAdds;
  final String type;
  PackageModel(
      {required this.count,
      required this.currency,
      required this.descriptionAr,
      required this.descriptionEn,
      required this.endDate,
      required this.id,
      required this.image,
      required this.nameAr,
      required this.nameEn,
      required this.percentage,
      required this.price,
      required this.sale,
      required this.salePrice,
      required this.showInAdds,
      required this.type});

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      count: json['count'] ?? 0,
      currency: json['currency'] ?? '',
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
    );
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('PackageModel {');
    sb.writeln('  count: $count');
    sb.writeln('  currency: $currency');
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
    sb.writeln('}');
    return sb.toString();
  }
}
