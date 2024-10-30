import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/form_controller.dart';

class TransactionPage extends StatelessWidget {
  final FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Category'),
                  value: controller.selectedCategoryId.value == 0
                      ? null
                      : controller.selectedCategoryId.value,
                  onChanged: (value) =>
                      controller.selectedCategoryId.value = value!,
                  items: controller.categories.map((category) {
                    return DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            Obx(() => DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Wallet'),
                  value: controller.selectedWalletId.value == 0
                      ? null
                      : controller.selectedWalletId.value,
                  onChanged: (value) =>
                      controller.selectedWalletId.value = value!,
                  items: controller.wallets.map((wallet) {
                    return DropdownMenuItem<int>(
                      value: wallet.id,
                      child: Text(wallet.name),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: DateTime.now().toIso8601String(),
              decoration: const InputDecoration(labelText: 'Time'),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.amount.value = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Note'),
              onChanged: (value) => controller.note.value = value,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi untuk menyimpan data
                if (controller.selectedCategoryId.value != 0 &&
                    controller.selectedWalletId.value != 0 &&
                    controller.amount.value.isNotEmpty) {
                  controller.submitTransaction();
                } else {
                  Get.snackbar('Error', 'Please complete all required fields');
                }
              },
              child: const Text('Save Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
