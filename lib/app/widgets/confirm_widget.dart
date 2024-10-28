import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';

Future confirmWidget({
  String? title,
  required String message,
  RxBool? loading,
  Function()? onPressed,
}) {
  loading ??= false.obs;
  return Get.defaultDialog(
    barrierDismissible: false,
    title: title ?? "confirm".tr,
    titlePadding: const EdgeInsets.only(top: 20),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          "assets/lotties/info.json",
          width: 150,
          height: 150,
        ),
        Text(
          message,
          style: const TextStyle(
            color: primaryBlack,
            fontSize: 16,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  title: "cancel".tr,
                  color: primaryRed,
                  loading: loading!.value,
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonWidget(
                  title: "sure".tr,
                  color: primaryBlue,
                  loading: loading.value,
                  onPressed: onPressed ?? () => Get.back(),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
