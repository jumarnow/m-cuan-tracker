import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/transaction_model.dart';

class TransactionService {
  static const String _baseUrl =
      'https://my-cuan-tracker.wd1ea4.easypanel.host/api';

  // Fetch all transactions
  Future<List<Transaction>> getTransactions() async {
    final response = await http.get(Uri.parse('$_baseUrl/transactions'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Transaction> transactions =
          body.map((dynamic item) => Transaction.fromJson(item)).toList();
      return transactions;
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<Transaction> createTransaction(Transaction transaction) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/transactions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'wallet_id': transaction.walletId,
        'category_id': transaction.categoryId,
        'amount': transaction.amount,
        'time': transaction.time,
        'note': transaction.note,
      }),
    );

    if (response.statusCode == 201) {
      return Transaction.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create transaction');
    }
  }
}
