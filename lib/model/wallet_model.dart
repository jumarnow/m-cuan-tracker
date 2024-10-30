
// wallet_model.dart
class Wallet {
  final int id;
  final String name;
  final String currency;
  final double balance;

  Wallet({required this.id, required this.name, required this.currency, required this.balance});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      name: json['name'],
      currency: json['currency'],
      balance: json['balance'].toDouble(),
    );
  }
}
