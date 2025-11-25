/// Review Model - Represents customer feedback for drivers
/// Used in: Fleet management, Driver profiles, Service quality tracking
class ReviewModel {
  final String? id;
  final String? customerName;
  final String? customerId;
  final String? driverId;
  final double? rating;
  final String? comment;
  final String? date; // ISO 8601 String
  final String? serviceType;
  final String? orderId;

  ReviewModel({
    this.id,
    this.customerName,
    this.customerId,
    this.driverId,
    this.rating,
    this.comment,
    this.date,
    this.serviceType,
    this.orderId,
  });

  /// Create ReviewModel from JSON
  factory ReviewModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return ReviewModel(
      id: id ?? json['id'] ?? '',
      customerName: json['customerName'] ?? 'Anonymous',
      customerId: json['customerId'] ?? '',
      driverId: json['driverId'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      comment: json['comment'] ?? '',
      date: json['date'] ?? DateTime.now().toIso8601String(),
      serviceType: json['serviceType'],
      orderId: json['orderId'],
    );
  }

  /// Convert ReviewModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'customerId': customerId,
      'driverId': driverId,
      'rating': rating,
      'comment': comment,
      'date': date,
      'serviceType': serviceType,
      'orderId': orderId,
    };
  }

  @override
  String toString() {
    return 'ReviewModel{id: $id, customerName: $customerName, driverId: $driverId, rating: $rating, comment: $comment, date: $date}';
  }
}
