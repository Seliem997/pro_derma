class ProductsDetailsModel{
  int? code;
  ProductDetailsData? data;

  ProductsDetailsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = json['data'] != null ? ProductDetailsData.fromJson(json['data']) : null;

  }
}

class ProductDetailsData{
  int? id;
  String? title;
  String? desc;
  String? unit;
  String? price;
  String? quantity;
  String? discount;
  String? from;
  String? to;

  ProductDetailsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    unit = json['unit'];
    price = json['price'];
    quantity = json['quantity'];
    discount = json['discount'];
    from = json['from'];
    to = json['to'];
  }
}