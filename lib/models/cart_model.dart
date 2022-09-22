class CartModel{
  int? code;
  List<CartData> data= [];

  CartModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    json['data'].forEach((element){
      data.add(CartData.fromJson(element));
    });
  }
}

class CartData{
  int? id;
  String? product;
  String? productId;
  String? quantity;
  String? discount;

  CartData.fromJson(Map<String, dynamic> json){
    id =json['id'];
    product =json['product'];
    productId =json['product_id'];
    quantity =json['quantity'];
    discount =json['discount'];
  }
}
