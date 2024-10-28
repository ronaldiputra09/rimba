import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';

Future confirmWidget({
  String title = "Konfirmasi",
  required String message,
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
        Row(
          children: [
            Expanded(
              child: ButtonWidget(
                title: "Batal",
                color: primaryRed,
                onPressed: () => Get.back(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ButtonWidget(
                title: "Yakin",
                color: primaryBlue,
                onPressed: onPressed ?? () => Get.back(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
