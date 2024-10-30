class Transaction {
  final int? id;
  final int walletId;
  final int categoryId;
  final String? walletName;
  final String? categoryName;
  final int? isExpense;
  final int amount;
  final String time;
  final String? note;

  Transaction({
    this.id,
    required this.walletId,
    required this.categoryId,
    this.walletName,
    this.categoryName,
    this.isExpense,
    required this.amount,
    required this.time,
    this.note,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      walletId: json['wallet_id'],
      categoryId: json['category_id'],
      walletName: json['wallet']['name'],
      categoryName: json['category']['name'],
      isExpense: json['category']['is_expense'],
      amount: json['amount'],
      time: json['time'],
      note: json['note'],
    );
  }
}
