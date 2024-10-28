import 'package:flutter/material.dart';
import 'package:test_rimba/app/data/colors.dart';

class FormWidget extends StatelessWidget {
  final String? title;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final double? radius;
  final bool maxLine;
  final Color? color;
  final bool capitalize;
  const FormWidget({
    super.key,
    this.title,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.readOnly,
    this.radius,
    this.maxLine = false,
    this.color,
    this.capitalize = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          replacement: const SizedBox(),
          child: Text(
            title ?? "",
            style: const TextStyle(
              color: primaryBlack,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: title != null ? 7 : 0),
        TextFormField(
          textCapitalization: capitalize
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          obscureText: obscureText ?? false,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          readOnly: readOnly ?? false,
          minLines: maxLine ? 1 : null,
          maxLines: maxLine ? 5 : 1,
          style: const TextStyle(
            color: primaryBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: TextStyle(
              color: primaryBlack.withOpacity(0.5),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: color ?? primaryGrey.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 16),
              ),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 16),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 16),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
