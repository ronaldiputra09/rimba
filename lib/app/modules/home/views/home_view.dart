import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ButtonWidget(
              title: "Button",
              onPressed: () {
                Get.toNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
