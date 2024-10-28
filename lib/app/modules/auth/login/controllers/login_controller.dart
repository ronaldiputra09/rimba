import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_rimba/app/network/api_path.dart';
import 'package:test_rimba/app/network/dio_client.dart';
import 'package:test_rimba/app/widgets/info_widget.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final dio = DioClient();
  var language = ''.obs;
  var isVisibility = true.obs;
  var isLoading = false.obs;

  var emailC = TextEditingController().obs;
  var passwordC = TextEditingController().obs;

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

  void loginPOST() async {
    isLoading.value = true;
    try {
      final res = await dio.post(
        ApiPath.LOGIN,
        data: {
          'email': emailC.value.text,
          'password': passwordC.value.text,
        },
      );
      var data = res.data['data'];
      box.write('token', data['accessToken']);
      box.write('user', data);
      Get.offAllNamed('/navbar');
    } catch (e) {
      infoWidget(
        type: "error",
        message: e.toString(),
      );
    }
    isLoading.value = false;
  }
}
