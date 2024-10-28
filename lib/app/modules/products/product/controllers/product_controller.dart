import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_rimba/app/models/product_model.dart';
import 'package:test_rimba/app/network/api_path.dart';
import 'package:test_rimba/app/network/dio_client.dart';
import 'package:test_rimba/app/widgets/info_widget.dart';

class ProductController extends GetxController {
  final dio = DioClient();
  var isLoading = false.obs;
  var dataProduct = <ProductModel>[].obs;

  var nameC = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<ProductModel>> getProduct() async {
    try {
      final res = await dio.get(ApiPath.PRODUCT);
      var data = res.data['data']['data'];
      dataProduct.value = ProductModel.fromJsonList(data);
      return dataProduct;
    } catch (e) {
      log('Error get product: $e');
      return dataProduct.value = [];
    }
  }

  void addProduct() async {
    isLoading(true);
    try {
      final res = await dio.post(ApiPath.PRODUCT, data: {
        'name': nameC.value.text,
      });
      nameC.value.clear();
      var data = res.data['message'];
      getProduct();
      infoWidget(
        type: 'success',
        message: data,
        onPressed: () {
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      infoWidget(type: 'error', message: e.toString());
    }
    isLoading(false);
  }

  void editProduct(String id) async {
    isLoading(true);
    try {
      final res = await dio.put('${ApiPath.PRODUCT}/$id', data: {
        'name': nameC.value.text,
      });
      nameC.value.clear();
      var data = res.data['message'];
      getProduct();
      infoWidget(
        type: 'success',
        message: data,
        onPressed: () {
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      infoWidget(type: 'error', message: e.toString());
    }
    isLoading(false);
  }

  void deleteProduct(String id) async {
    isLoading(true);
    try {
      final res = await dio.delete('${ApiPath.PRODUCT}/$id');
      var data = res.data['message'];
      getProduct();
      infoWidget(
        type: 'success',
        message: data,
        onPressed: () {
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      infoWidget(type: 'error', message: e.toString());
    }
    isLoading(false);
  }
}
