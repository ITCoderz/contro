class SellerFinanceModel {
  String financeId, amount, date, service;

  bool isRevenue;

  SellerFinanceModel({
    required this.financeId,
    required this.amount,
    required this.date,
    required this.service,
    required this.isRevenue,
  });
}
