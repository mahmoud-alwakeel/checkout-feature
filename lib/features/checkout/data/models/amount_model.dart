class AmountModel {
  final String total;
  final String currency;
  final AmountDetailsModel details;

  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'],
      currency: json['currency'],
      details: AmountDetailsModel.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details.toJson(),
    };
  }
}

class AmountDetailsModel {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  AmountDetailsModel({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) {
    return AmountDetailsModel(
      subtotal: json['subtotal'],
      shipping: json['shipping'],
      shippingDiscount: json['shipping_discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
