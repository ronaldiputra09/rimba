import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/models/product_model.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';
import 'package:test_rimba/app/widgets/confirm_widget.dart';
import 'package:test_rimba/app/widgets/form_widget.dart';
import 'package:test_rimba/app/widgets/loading_widget.dart';
import 'package:intl/intl.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({super.key});
  final productC = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title_product_page'.tr),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogAddProduct();
        },
        backgroundColor: primaryBlue,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: productC.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingWidget(size: 25, color: primaryBlue),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (productC.dataProduct.isEmpty) {
            return Center(
              child: Text('data_empty'.tr),
            );
          } else {
            return Obx(
              () => ListView.builder(
                itemCount: productC.dataProduct.length,
                itemBuilder: (context, index) {
                  final data = productC.dataProduct[index];
                  return ListTile(
                    onTap: () {
                      _dialogDetailProduct(data);
                    },
                    title: Text('${data.name}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: primaryRed),
                      onPressed: () {
                        confirmWidget(
                          message: 'confirm_delete_product'.tr,
                          loading: productC.isLoading,
                          onPressed: () {
                            productC.deleteProduct(data.id ?? '');
                          },
                        );
                      },
                    ),
                    subtitle: Text(
                      DateFormat('dd MMM yyyy').format(
                        DateTime.parse(
                          data.createdAt ?? DateTime.now().toString(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Future _dialogAddProduct() {
    return Get.defaultDialog(
      title: 'title_product_add'.tr,
      radius: 16,
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      content: Column(
        children: [
          FormWidget(
            title: 'Name',
            hintText: 'Enter product name',
            controller: productC.nameC.value,
          ),
          const SizedBox(height: 20),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    title: 'cancel'.tr,
                    loading: productC.isLoading.value,
                    onPressed: () {
                      Get.back();
                    },
                    color: primaryRed,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ButtonWidget(
                    title: 'save'.tr,
                    loading: productC.isLoading.value,
                    onPressed: () {
                      if (productC.isLoading.isFalse) {
                        productC.addProduct();
                      }
                    },
                    color: primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _dialogDetailProduct(ProductModel data) {
    productC.nameC.value.text = data.name ?? '';
    return Get.defaultDialog(
      title: 'title_product_detail'.tr,
      radius: 16,
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      content: Column(
        children: [
          FormWidget(
            title: 'Name',
            hintText: 'Enter product name',
            controller: productC.nameC.value,
          ),
          const SizedBox(height: 20),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    title: 'cancel'.tr,
                    loading: productC.isLoading.value,
                    onPressed: () {
                      Get.back();
                    },
                    color: primaryRed,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ButtonWidget(
                    title: 'edit'.tr,
                    loading: productC.isLoading.value,
                    onPressed: () {
                      if (productC.isLoading.isFalse) {
                        productC.editProduct(data.id ?? '');
                      }
                    },
                    color: primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
