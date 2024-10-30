// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:myapp/config/app_asset.dart';
import 'package:myapp/config/app_color.dart';
import 'package:myapp/config/app_format.dart';
import 'package:myapp/controller/transaction_controller.dart';
import 'package:myapp/model/transaction_model.dart';

class HistoryPage extends StatelessWidget {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        header(context),
        const SizedBox(height: 24),
        GetBuilder<TransactionController>(builder: (_) {
          return GroupedListView<Transaction, String>(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            elements: _.transactions,
            groupBy: (element) => AppFormat.dateOnly(element.time),
            groupSeparatorBuilder: (String groupByValue) {
              String time = DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
                      groupByValue
                  ? 'Today New'
                  : AppFormat.dateMonth(groupByValue);
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  time,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              );
            },
            itemBuilder: (context, element) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: item(context, element),
                ),
              );
            },
            itemComparator: (item1, item2) => item1.time.compareTo(item2.time),
            order: GroupedListOrder.DESC,
          );
        }),
      ],
    );
  }

  Widget item(BuildContext context, Transaction transaction) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.categoryName.toString(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  transaction.note == null
                      ? ''
                      : transaction.note.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              color:
                  transaction.isExpense == 1 ? Colors.red : AppColor.secondary,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            child: Text(
              AppFormat.currency(transaction.amount.toDouble()),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
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
              Obx(() {
                return Text(
                  '${transactionController.transactions.length} transactions',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
