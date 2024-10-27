import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/transaction_controller.dart';

class HistoryPage extends StatelessWidget {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: Obx(() {
        if (transactionController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (transactionController.transactions.isEmpty) {
          return const Center(child: Text('No transactions found'));
        } else {
          return ListView.builder(
            itemCount: transactionController.transactions.length,
            itemBuilder: (context, index) {
              var transaction = transactionController.transactions[index];
              return ListTile(
                title: Text('Amount: ${transaction.amount}'),
                subtitle: Text(
                    'Category: ${transaction.categoryName}, Wallet: ${transaction.walletName}'),
                trailing: Text(transaction.time),
              );
            },
          );
        }
      }),
    );
  }
}
