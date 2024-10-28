class TrxModel {
  String? id;
  String? invoiceNo;
  String? date;
  String? customer;
  String? userId;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;

  TrxModel(
      {this.id,
      this.invoiceNo,
      this.date,
      this.customer,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.products});

  TrxModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoiceNo'];
    date = json['date'];
    customer = json['customer'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoiceNo'] = invoiceNo;
    data['date'] = date;
    data['customer'] = customer;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<TrxModel> fromJsonList(List<dynamic> json) {
    return json.map((e) => TrxModel.fromJson(e)).toList();
  }
}

class Products {
  String? id;
  int? quantity;
  int? price;
  String? productId;
  String? transactionId;
  String? createdAt;
  String? updatedAt;
  Product? product;

  Products(
      {this.id,
      this.quantity,
      this.price,
      this.productId,
      this.transactionId,
      this.createdAt,
      this.updatedAt,
      this.product});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    productId = json['productId'];
    transactionId = json['transactionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    data['productId'] = productId;
    data['transactionId'] = transactionId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Product(
      {this.id,
      this.name,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
