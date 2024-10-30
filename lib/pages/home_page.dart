import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/config/app_asset.dart';
import 'package:myapp/config/app_color.dart';
import 'package:myapp/controller/c_home.dart';
import 'package:myapp/pages/add_page.dart';
import 'package:myapp/pages/history_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.wallets, 'label': 'Wallets'},
    {'icon': AppAsset.iconHistory, 'label': 'Budgets'},
    {'icon': AppAsset.add},
    {'icon': AppAsset.iconPayment, 'label': 'Repors'},
    {'icon': AppAsset.iconReward, 'label': 'More'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: cHome.indexPage,
          children: [
            HistoryPage(),
            Container(),
            AddPage(),
            Container(),
            Container(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return Material(
          elevation: 8,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: BottomNavigationBar(
              currentIndex: cHome.indexPage,
              onTap: (value) => cHome.indexPage = value,
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: AppColor.primary,
              ),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              selectedFontSize: 12,
              items: listNav.map((e) {
                return BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(e['icon'])),
                  label: e['label'] ?? '',
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
