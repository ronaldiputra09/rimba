import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_rimba/app/models/product_model.dart';
import 'package:test_rimba/app/models/trx_model.dart';
import 'package:test_rimba/app/network/api_path.dart';
import 'package:test_rimba/app/network/dio_client.dart';
import 'package:test_rimba/app/widgets/info_widget.dart';

class TransactionController extends GetxController {
  final dio = DioClient();
  var isLoading = false.obs;
  var dataTrx = <TrxModel>[].obs;
  var dataDetailTrx = TrxModel().obs;
  var dataCart = [].obs;

  var customerC = TextEditingController().obs;

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

  Future<List<TrxModel>> getTrx() async {
    try {
      final res = await dio.get(ApiPath.TRANSACTION);
      var data = res.data['data']['data'];
      dataTrx.value = TrxModel.fromJsonList(data);
      return dataTrx;
    } catch (e) {
      log('Error get product: $e');
      return dataTrx.value = [];
    }
  }

  void deleteProduct(String id) async {
    isLoading(true);
    try {
      final res = await dio.delete('${ApiPath.TRANSACTION}/$id');
      var data = res.data['message'];
      getTrx();
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

  void addCart(ProductModel product) {
    var data = {
      'productId': product.id,
      'product_name': product.name,
      'price': 0,
      'quantity': 1,
    };
    // jika dataCart kosong maka tambahkan data dan jika dataCart tidak kosong maka cek apakah productId sudah ada di dataCart
    if (dataCart.isEmpty) {
      dataCart.add(data);
    } else {
      var index =
          dataCart.indexWhere((element) => element['productId'] == product.id);
      if (index == -1) {
        dataCart.add(data);
      } else {
        dataCart[index]['quantity'] += 1;
      }
    }
  }

  void addTransaction() async {
    isLoading(true);
    try {
      var data = {
        'invoiceNo': "INV-${DateTime.now().millisecondsSinceEpoch}",
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'customer': customerC.value.text,
        'products': dataCart.map((element) {
          element.remove('product_name');
          return element;
        }).toList(),
      };
      final res = await dio.post(ApiPath.TRANSACTION, data: data);
      var message = res.data['message'];
      getTrx();
      customerC.value.clear();
      dataCart.clear();
      dataTrx.refresh();
      infoWidget(
        type: 'success',
        message: message,
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

  void editTransaction() async {
    isLoading(true);
    try {
      var data = {
        'invoiceNo': dataDetailTrx.value.invoiceNo,
        'date': dataDetailTrx.value.date,
        'customer': customerC.value.text,
        'products': dataCart.map((element) {
          element.remove('product_name');
          return element;
        }).toList(),
      };
      final res = await dio.put(
        '${ApiPath.TRANSACTION}/${dataDetailTrx.value.id}',
        data: data,
      );
      var message = res.data['message'];
      getTrx();
      customerC.value.clear();
      dataCart.clear();
      dataTrx.refresh();
      infoWidget(
        type: 'success',
        message: message,
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

  Future<TrxModel> getDetailTrx(String id) async {
    try {
      final res = await dio.get('${ApiPath.TRANSACTION}/$id');
      var data = res.data['data'];
      dataDetailTrx.value = TrxModel.fromJson(data);
      // masukan data product ke dataCart
      dataCart.value = dataDetailTrx.value.products!.map((e) {
        return {
          'productId': e.productId,
          'product_name': e.product?.name,
          'price': e.price,
          'quantity': e.quantity,
        };
      }).toList();
      return dataDetailTrx.value;
    } catch (e) {
      log('Error get detail trx: $e');
      return dataDetailTrx.value = TrxModel();
    }
  }
}
