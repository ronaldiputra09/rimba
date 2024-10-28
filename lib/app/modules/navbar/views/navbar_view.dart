import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/modules/auth/login/views/login_view.dart';
import 'package:test_rimba/app/modules/products/product/views/product_view.dart';
import 'package:test_rimba/app/modules/transactions/transaction/views/transaction_view.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => bottomNav()),
      body: Obx(() => bodyNav()),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      onTap: (value) {
        controller.index.value = value;
      },
      currentIndex: controller.index.value,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryBlue,
      unselectedItemColor: primaryBlack,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      backgroundColor: primaryWhite,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            color: controller.index.value == 0 ? primaryBlue : primaryBlack,
          ),
          label: 'title_product'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.timeline_rounded,
            color: controller.index.value == 1 ? primaryBlue : primaryBlack,
          ),
          label: 'title_trx'.tr,
        ),
      ],
    );
  }

  bodyNav() {
    switch (controller.index.value) {
      case 0:
        return ProductView();
      case 1:
        return TransactionView();
      default:
        return LoginView();
    }
  }
}
