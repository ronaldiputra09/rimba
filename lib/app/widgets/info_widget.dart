import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';

Future infoWidget({
  String title = "Informasi",
  required String type,
  required String message,
  String? textButton,
  Function()? onPressed,
}) {
  return Get.defaultDialog(
    barrierDismissible: false,
    title: title,
    titlePadding: const EdgeInsets.only(top: 20),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          type == "success"
              ? "assets/lotties/success.json"
              : "assets/lotties/failed.json",
          width: 150,
          height: 150,
          repeat: false,
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
        Row(
          children: [
            Expanded(
              child: ButtonWidget(
                title: textButton ?? "ok".tr,
                color: type == "success" ? primaryBlue : primaryRed,
                onPressed: onPressed ?? () => Get.back(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
