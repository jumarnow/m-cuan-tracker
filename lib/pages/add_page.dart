import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/config/app_asset.dart';
import 'package:myapp/controller/form_controller.dart';

// ignore: use_key_in_widget_constructors
class AddPage extends StatelessWidget {
  final FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        header(context),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                  controller.submitTransaction();
                  // Navigasi kembali ke halaman sebelumnya setelah menyimpan
                  Get.back();
                },
                child: const Text('Save Transaction'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              AppAsset.profile,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'My Transactions',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
