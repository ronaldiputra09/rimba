import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';
import 'package:test_rimba/app/widgets/form_widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
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
              const SizedBox(height: 20),
              FormWidget(
                hintText: 'hint_name'.tr,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              FormWidget(
                hintText: 'hint_phone'.tr,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.call),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Obx(
                () => FormWidget(
                  hintText: 'hint_password_confirm'.tr,
                  obscureText: controller.isVisibility2.value,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.isVisibility2.toggle();
                    },
                    child: Icon(
                      controller.isVisibility2.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                title: 'button_register'.tr,
                onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
