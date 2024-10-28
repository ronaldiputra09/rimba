import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/themes.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Rimba Apps",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.light,
    ),
  );
}
