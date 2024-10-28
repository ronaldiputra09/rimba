import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_rimba/app/data/colors.dart';
import 'package:test_rimba/app/modules/transactions/transaction/controllers/transaction_controller.dart';
import 'package:test_rimba/app/widgets/button_widget.dart';
import 'package:test_rimba/app/widgets/form_widget.dart';
import 'package:test_rimba/app/widgets/loading_widget.dart';

class DetailTransactionView extends GetView {
  DetailTransactionView({super.key});
  final trxC = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title_trx_detail'.tr),
        centerTitle: true,
      ),
      bottomNavigationBar: _checkout(),
      body: FutureBuilder(
        future: trxC.getDetailTrx(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingWidget(
                size: 25,
                color: Colors.blue,
              ),
            );
          } else {
            trxC.customerC.value.text = trxC.dataDetailTrx.value.customer ?? '';
            return Obx(
              () => SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _body(),
                    const SizedBox(height: 14),
                    _listProduct()
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        FormWidget(
          title: 'invoice_no'.tr,
          controller: TextEditingController(
            text: trxC.dataDetailTrx.value.invoiceNo,
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        FormWidget(
          title: 'date'.tr,
          controller: TextEditingController(
            text: DateFormat('dd MMMM yyyy').format(
              DateTime.parse(trxC.dataDetailTrx.value.date ?? ''),
            ),
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        FormWidget(
          title: 'customer'.tr,
          controller: trxC.customerC.value,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'product'.tr,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _listProduct() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: trxC.dataCart.length,
      itemBuilder: (context, index) {
        var data = trxC.dataCart[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['product_name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: TextFormField(
                          initialValue: data['price'].toString(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 0,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            data['price'] = int.parse(value);
                            trxC.dataCart.refresh();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          // jika qty 1 maka hapus data
                          if (data['quantity'] == 1) {
                            trxC.dataCart.removeAt(index);
                          } else {
                            data['quantity'] -= 1;
                          }
                          trxC.dataCart.refresh();
                        },
                      ),
                      const SizedBox(width: 8),
                      Text('${data['quantity'] ?? "0"}'),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          data['quantity'] += 1;
                          trxC.dataCart.refresh();
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Rp. ${data['price'] * data['quantity'] ?? "0"}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _checkout() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: primaryWhite,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'total'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Obx(
                      () => Text(
                        // hitung total harga
                        'Rp. ${(trxC.dataCart.fold<num>(0, (previousValue, element) => previousValue + (element['price'] * element['quantity'])) as int)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Obx(
                  () => ButtonWidget(
                    title: 'edit'.tr,
                    loading: trxC.isLoading.value,
                    onPressed: () {
                      if (trxC.isLoading.isFalse) {
                        trxC.editTransaction();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
