import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_rimba/app/data/themes.dart';
import 'package:test_rimba/app/utils/language.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Rimba App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.light,
      translations: Language(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'ID'),
    ),
  );
}
