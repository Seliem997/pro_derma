class MyOrdersModel{
  int? code;
  List<DataOfOrders> dataModel= [];


  MyOrdersModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    json['data'].forEach((element){
      dataModel.add(DataOfOrders.fromJson(element));
    });
  }
}

class DataOfOrders{
  int? id;
  String? country;
  String? government;
  String? city;
  String? address;
  String? status;
  String? total;
  List<DataOfOrdersProducts> dataOrderProducts= [];

  DataOfOrders.fromJson(Map<String,dynamic> json){
    id = json['id'];
    country = json['country'];
    government = json['government'];
    city = json['city'];
    address = json['address'];
    status = json['status'];
    total = json['total'];
    json['products'].forEach((element){
      dataOrderProducts.add(DataOfOrdersProducts.fromJson(element));
    });
  }

}

class DataOfOrdersProducts{
  int? id;
  String? product_id;
  String? product;
  String? price;
  String? quantity;
  String? discount;

  DataOfOrdersProducts.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product_id = json['product_id'];
    product = json['product'];
    price = json['price'];
    quantity = json['quantity'];
    discount = json['discount'];
  }
}