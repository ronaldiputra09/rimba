import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (box.read('token') != null) {
          Get.offNamed('/navbar');
        } else {
          Get.offNamed('/login');
        }
      },
    );
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
}
