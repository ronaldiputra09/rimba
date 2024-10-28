import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isVisibility = true.obs;
  var language = ''.obs;
  @override
  void onInit() {
    language.value = Get.deviceLocale.toString();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeLanguage(String lang) {
    language.value = lang;
    Get.updateLocale(Locale(lang));
  }
}
