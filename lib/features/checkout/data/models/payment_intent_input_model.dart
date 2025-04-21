class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });
  Map<String, dynamic> tojson() {
    return {
      // 'amount': (double.parse(amount) * 100).round(),
      'amount': amount,
      'currency': currency,
      'customer': customerId,
    };
  }
}
