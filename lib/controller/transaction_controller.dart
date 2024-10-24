import 'package:get/get.dart';
import 'package:myapp/model/transaction_model.dart';
import 'package:myapp/services/transaction_service.dart';

class TransactionController extends GetxController {
  var transactions = <Transaction>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  // Fetch transactions from API
  void fetchTransactions() async {
    try {
      isLoading(true);
      var fetchedTransactions = await TransactionService().getTransactions();
      transactions.value = fetchedTransactions;
    } finally {
      isLoading(false);
    }
  }
}
