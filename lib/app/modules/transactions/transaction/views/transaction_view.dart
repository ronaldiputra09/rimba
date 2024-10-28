import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/modules/products/product/controllers/product_controller.dart';
import 'package:test_rimba/app/widgets/confirm_widget.dart';
import 'package:test_rimba/app/widgets/loading_widget.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  TransactionView({super.key});
  final trxC = Get.put(TransactionController());
  final productC = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title_trx_page'.tr),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.toNamed('/cart');
                },
              ),
              Positioned(
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: primaryRed,
                    shape: BoxShape.circle,
                  ),
                  child: Obx(
                    () => Text(
                      trxC.dataCart.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogAddCart();
        },
        backgroundColor: primaryBlue,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: trxC.getTrx(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingWidget(size: 25, color: primaryBlue),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (trxC.dataTrx.isEmpty) {
            return Center(
              child: Text('data_empty'.tr),
            );
          } else {
            return Obx(
              () => ListView.builder(
                itemCount: trxC.dataTrx.length,
                itemBuilder: (context, index) {
                  final data = trxC.dataTrx[index];
                  return ListTile(
                    onTap: () {
                      Get.toNamed('/detail-transaction', arguments: data.id);
                    },
                    title: Text('${data.invoiceNo} (${data.customer})'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: primaryRed),
                      onPressed: () {
                        confirmWidget(
                          message: 'confirm_delete_product'.tr,
                          loading: trxC.isLoading,
                          onPressed: () {
                            trxC.deleteProduct(data.id ?? '');
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

  Future _dialogAddCart() {
    return Get.defaultDialog(
      title: 'add_cart'.tr,
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      content: SizedBox(
        width: Get.width,
        height: Get.height * 0.3,
        child: FutureBuilder(
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
                        trxC.addCart(data);
                        Get.back();
                      },
                      title: Text('${data.name}'),
                      trailing: const Icon(Icons.add),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
