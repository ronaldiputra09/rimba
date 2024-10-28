class ProductModel {
  String? id;
  String? name;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ProductModel(
      {this.id,
      this.name,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
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

  static List<ProductModel> fromJsonList(List list) {
    return list.map((item) => ProductModel.fromJson(item)).toList();
  }
}
