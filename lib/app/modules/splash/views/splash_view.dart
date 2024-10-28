import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/widgets/loading_widget.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({super.key});
  final splashC = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Rimba.',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: primaryOrange,
                  ),
                ),
              ),
            ),
            LoadingWidget(
              size: 25,
              color: primaryOrange,
            ),
          ],
        ),
      ),
    );
  }
}
