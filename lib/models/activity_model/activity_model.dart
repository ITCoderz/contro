class ActivityModel {
  String? orderId;
  String? created;
  String? price;
  String? status;

  ActivityModel({
    required this.orderId,
    required this.created,
    required this.price,
    required this.status,
  });

  ActivityModel.fromJson(dynamic json) {
    orderId = json['orderId'];

    created = json['created'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['created'] = created;
    map['price'] = price;
    map['status'] = status;

    return map;
  }
}
