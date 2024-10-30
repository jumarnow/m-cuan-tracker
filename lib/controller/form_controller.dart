// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:myapp/model/category_modal.dart';
import 'package:myapp/model/transaction_model.dart';
import 'package:myapp/model/wallet_model.dart';
import 'package:myapp/services/category_service.dart';
import 'package:myapp/services/transaction_service.dart';
import 'package:myapp/services/wallet_service.dart';

class FormController extends GetxController {
  var categories = <Category>[].obs;
  var wallets = <Wallet>[].obs;

  var selectedCategoryId = 0.obs;
  var selectedWalletId = 0.obs;
  var amount = ''.obs;
  var note = ''.obs;

  final TransactionService _transactionService = TransactionService();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchWallets();
  }

  void fetchCategories() async {
    try {
      categories.value = await CategoryService().getCategories();
    } catch (e) {
      // ignore: duplicate_ignore
      // ignore: avoid_print
      print('Failed to load categories: $e');
    }
  }

  void fetchWallets() async {
    try {
      wallets.value = await WalletService().getWallets();
    } catch (e) {
      print('Failed to load wallets: $e');
    }
  }

  Future<void> submitTransaction() async {
    try {
      // Buat objek Transaction dari nilai-nilai form
      final newTransaction = Transaction(
        walletId: selectedWalletId.value,
        categoryId: selectedCategoryId.value,
        amount: int.parse(amount.value),
        time: DateTime.now().toIso8601String(),
        note: note.value.isNotEmpty ? note.value : null,
      );

      // Panggil service untuk membuat transaksi
      await _transactionService.createTransaction(newTransaction);
      Get.snackbar('Success', 'Transaction saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save transaction');
    }
  }
}
