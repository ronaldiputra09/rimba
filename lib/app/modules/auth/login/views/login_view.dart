import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';
import 'package:test_rimba/app/widgets/form_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              _lang(),
              const SizedBox(height: 20),
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

  Widget _lang() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              controller.changeLanguage("en_US");
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: controller.language.value == "en_US" ||
                      controller.language.value == "en_ID"
                  ? primaryOrange
                  : primaryBlack.withOpacity(0.3),
              child: const Text('EN', style: TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              controller.changeLanguage("id_ID");
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: controller.language.value == "id_ID"
                  ? primaryOrange
                  : primaryBlack.withOpacity(0.3),
              child: const Text('ID', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Column(
      children: [
        Text(
          'title_login'.tr,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'subtitle_login'.tr,
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
          hintText: 'hint_email'.tr,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
        ),
        const SizedBox(height: 20),
        Obx(
          () => FormWidget(
            hintText: 'hint_password'.tr,
            obscureText: controller.isVisibility.value,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: () {
                controller.isVisibility.toggle();
              },
              child: Icon(
                controller.isVisibility.value
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
        ButtonWidget(
          title: 'button_login'.tr,
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'text_dont_have_account'.tr,
              style: TextStyle(
                color: primaryBlack.withOpacity(0.5),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/register');
              },
              child: Text(
                'button_register'.tr,
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
