class AddOrderModel{
  int? code;
  String? message;
  AddOrderData? data;

  AddOrderModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? AddOrderData.fromJson(json['data']) : null;

  }
}

class AddOrderData{
  int? id;
  String? country;
  String? government;
  String? city;
  String? address;
  String? status;
  int? total;
  List<AddDataOrdersProducts> dataAddOrderProducts= [];

  AddOrderData.fromJson(Map <String, dynamic> json){
    id = json['id'];
    country = json['country'];
    government = json['government'];
    city = json['city'];
    address = json['address'];
    status = json['status'];
    total = json['total'];
    json['products'].forEach((element) {
      dataAddOrderProducts.add(AddDataOrdersProducts.fromJson(element));
    });
  }
}
class AddDataOrdersProducts{
  int? id;
  String? productId;
  String? product;
  String? price;
  String? quantity;
  String? discount;

  AddDataOrdersProducts.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    product = json['product'];
    price = json['price'];
    quantity = json['quantity'];
    discount = json['discount'];
  }
}