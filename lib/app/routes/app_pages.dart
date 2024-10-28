import 'package:get/get.dart';
import 'package:test_rimba/app/modules/navbar/views/navbar_view.dart';
import 'package:test_rimba/app/modules/products/product/bindings/product_binding.dart';
import 'package:test_rimba/app/modules/products/product/views/product_view.dart';
import 'package:test_rimba/app/modules/transactions/transaction/bindings/transaction_binding.dart';
import 'package:test_rimba/app/modules/transactions/transaction/views/transaction_view.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
  ];
}
