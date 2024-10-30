import 'package:myapp/model/wallet_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WalletService {
  static const String _baseUrl = 'https://my-cuan-tracker.wd1ea4.easypanel.host/api';

  Future<List<Wallet>> getWallets() async {
    final response = await http.get(Uri.parse('$_baseUrl/wallets'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Wallet.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load wallets');
    }
  }
}