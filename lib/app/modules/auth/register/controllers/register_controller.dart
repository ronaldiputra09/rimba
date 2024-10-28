import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_rimba/app/network/api_path.dart';
import 'package:test_rimba/app/network/dio_client.dart';
import 'package:test_rimba/app/widgets/info_widget.dart';

class RegisterController extends GetxController {
  final box = GetStorage();
  final dio = DioClient();
  var isVisibility = true.obs;
  var isLoading = false.obs;

  var nameC = TextEditingController().obs;
  var phoneC = TextEditingController().obs;
  var emailC = TextEditingController().obs;
  var passwordC = TextEditingController().obs;

  @override
  void onInit() {
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

  void registerPOST() async {
    isLoading.value = true;
    try {
      final res = await dio.post(
        ApiPath.REGISTER,
        data: {
          'name': nameC.value.text,
          'phoneNumber': phoneC.value.text,
          'email': emailC.value.text,
          'password': passwordC.value.text,
        },
      );
      var message = res.data['message'];
      infoWidget(
        type: 'success',
        message: message,
        onPressed: () => Get.offAllNamed('/login'),
      );
    } catch (e) {
      infoWidget(type: 'error', message: e.toString());
    }
    isLoading.value = false;
  }
}
