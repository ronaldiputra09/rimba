import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';
import 'package:test_rimba/app/widgets/form_widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final registerC = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              _title(),
              const SizedBox(height: 20),
              _form(),
              const SizedBox(height: 20),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      children: [
        Text(
          'title_register'.tr,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'subtitle_register'.tr,
          style: TextStyle(
            fontSize: 16,
            color: primaryBlack.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _form() {
    return Column(
      children: [
        FormWidget(
          controller: registerC.nameC.value,
          hintText: 'hint_name'.tr,
          keyboardType: TextInputType.text,
          prefixIcon: const Icon(Icons.person),
        ),
        const SizedBox(height: 20),
        FormWidget(
          controller: registerC.phoneC.value,
          hintText: 'hint_phone'.tr,
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.call),
        ),
        const SizedBox(height: 20),
        FormWidget(
          controller: registerC.emailC.value,
          hintText: 'hint_email'.tr,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
        ),
        const SizedBox(height: 20),
        Obx(
          () => FormWidget(
            controller: registerC.passwordC.value,
            hintText: 'hint_password'.tr,
            obscureText: registerC.isVisibility.value,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: () {
                registerC.isVisibility.toggle();
              },
              child: Icon(
                registerC.isVisibility.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _footer() {
    return Column(
      children: [
        Obx(
          () => ButtonWidget(
            title: 'button_register'.tr,
            loading: registerC.isLoading.value,
            onPressed: () {
              if (registerC.isLoading.isFalse) {
                registerC.registerPOST();
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'text_have_account'.tr,
              style: TextStyle(
                color: primaryBlack.withOpacity(0.5),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'button_login'.tr,
                style: const TextStyle(
                  color: primaryOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
