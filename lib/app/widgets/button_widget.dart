import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final BorderSide? borderSide;
  final bool? loading;
  const ButtonWidget({
    super.key,
    this.title,
    this.onPressed,
    this.color,
    this.textColor,
    this.radius,
    this.borderSide,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading == true ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: borderSide ?? BorderSide.none,
        backgroundColor: color ?? primaryBlue,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
        fixedSize: Size.fromWidth(Get.width),
      ),
      child: Text(
        title ?? "",
        style: TextStyle(
          color: textColor ?? primaryWhite,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
