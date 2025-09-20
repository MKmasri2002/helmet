// class PaymentResponseModel {
//   PaymentResponseData? paymentResponse;

//   PaymentResponseModel({this.paymentResponse});

//   PaymentResponseModel.fromJson(Map<String, dynamic> json) {
//     paymentResponse = json['paymentResponse'] != null
//         ? PaymentResponseData.fromJson(json['paymentResponse'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (paymentResponse != null) {
//       data['paymentResponse'] = paymentResponse!.toJson();
//     }
//     return data;
//   }
// }

// class PaymentResponseData {
//   String? id;
//   String? status;
//   int? amount;
//   int? fee;
//   String? currency;
//   int? refunded;
//   dynamic refundedAt;
//   int? captured;
//   dynamic capturedAt;
//   dynamic voidedAt;
//   String? description;
//   String? amountFormat;
//   String? feeFormat;
//   String? refundedFormat;
//   String? capturedFormat;
//   dynamic invoiceId;
//   String? ip;
//   String? callbackUrl;
//   String? createdAt;
//   String? updatedAt;
//   Metadata? metadata;
//   SourcePayment? source;

//   PaymentResponseData(
//       {this.id,
//       this.status,
//       this.amount,
//       this.fee,
//       this.currency,
//       this.refunded,
//       this.refundedAt,
//       this.captured,
//       this.capturedAt,
//       this.voidedAt,
//       this.description,
//       this.amountFormat,
//       this.feeFormat,
//       this.refundedFormat,
//       this.capturedFormat,
//       this.invoiceId,
//       this.ip,
//       this.callbackUrl,
//       this.createdAt,
//       this.updatedAt,
//       this.metadata,
//       this.source});

//   PaymentResponseData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     amount = json['amount'];
//     fee = json['fee'];
//     currency = json['currency'];
//     refunded = json['refunded'];
//     refundedAt = json['refunded_at'];
//     captured = json['captured'];
//     capturedAt = json['captured_at'];
//     voidedAt = json['voided_at'];
//     description = json['description'];
//     amountFormat = json['amount_format'];
//     feeFormat = json['fee_format'];
//     refundedFormat = json['refunded_format'];
//     capturedFormat = json['captured_format'];
//     invoiceId = json['invoice_id'];
//     ip = json['ip'];
//     callbackUrl = json['callback_url'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     metadata = json['metadata'] != null
//         ? Metadata.fromJson(json['metadata'])
//         : null;
//     source =
//         json['source'] != null ? SourcePayment.fromJson(json['source']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['status'] = status;
//     data['amount'] = amount;
//     data['fee'] = fee;
//     data['currency'] = currency;
//     data['refunded'] = refunded;
//     data['refunded_at'] = refundedAt;
//     data['captured'] = captured;
//     data['captured_at'] = capturedAt;
//     data['voided_at'] = voidedAt;
//     data['description'] = description;
//     data['amount_format'] = amountFormat;
//     data['fee_format'] = feeFormat;
//     data['refunded_format'] = refundedFormat;
//     data['captured_format'] = capturedFormat;
//     data['invoice_id'] = invoiceId;
//     data['ip'] = ip;
//     data['callback_url'] = callbackUrl;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (metadata != null) {
//       data['metadata'] = metadata!.toJson();
//     }
//     if (source != null) {
//       data['source'] = source!.toJson();
//     }
//     return data;
//   }
// }

// class Metadata {
//   String? size;

//   Metadata({this.size});

//   Metadata.fromJson(Map<String, dynamic> json) {
//     size = json['size'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['size'] = size;
//     return data;
//   }
// }

// class SourcePayment {
//   String? company;
//   String? name;
//   String? number;
//   String? gatewayId;
//   dynamic referenceNumber;
//   String? token;
//   String? message;
//   String? transactionUrl;

//   SourcePayment(
//       {this.company,
//       this.name,
//       this.number,
//       this.gatewayId,
//       this.referenceNumber,
//       this.token,
//       this.message,
//       this.transactionUrl});

//   SourcePayment.fromJson(Map<String, dynamic> json) {
//     company = json['company'];
//     name = json['name'];
//     number = json['number'];
//     gatewayId = json['gateway_id'];
//     referenceNumber = json['reference_number'];
//     token = json['token'];
//     message = json['message'];
//     transactionUrl = json['transaction_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['company'] = company;
//     data['name'] = name;
//     data['number'] = number;
//     data['gateway_id'] = gatewayId;
//     data['reference_number'] = referenceNumber;
//     data['token'] = token;
//     data['message'] = message;
//     data['transaction_url'] = transactionUrl;
//     return data;
//   }
// }
