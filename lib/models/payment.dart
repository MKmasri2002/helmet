class Payment {
  String? method;
  String? status;
  String? date;
  int? amount;
  String? transactionId;
  String? token;
  String? id;
  String? card;
  String? receipt;
  String? statusMessage;
  Payment({
    this.method,
    this.status,
    this.date,
    this.amount,
    this.transactionId,
    this.token,
    this.id,
    this.card,
    this.receipt,
    this.statusMessage,
  });
  Payment.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    date = json['date'];
    amount = json['amount'];
    transactionId = json['transaction_id'];
    token = json['token'];
    id = json['id'];
    card = json['card'];
    receipt = json['receipt'];
    statusMessage = json['status_message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['method'] = method;
    data['status'] = status;
    data['date'] = date;
    data['amount'] = amount;
    data['transaction_id'] = transactionId;
    data['token'] = token;
    data['id'] = id;
    data['card'] = card;
    data['receipt'] = receipt;
    data['status_message'] = statusMessage;
    return data;
  }
}