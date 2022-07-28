class HomeModel{
  int? code;
  // DataProductsModel? data;
  List<DataProductsModel> dataModel=[];


  HomeModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    // data = DataProductsModel.fromJson(json['data']);
    json['data'].forEach((element){
      dataModel.add(DataProductsModel.fromJson(element));
    });
  }
}

class DataProductsModel{
  int? id;
  String? title;
  String? desc;
  String? unit;
  String? price;
  String? discount;
  String? from;
  String? to;


  DataProductsModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    unit = json['unit'];
    price = json['price'];
    discount = json['discount'];
    from = json['from'];
    to = json['to'];
  }

}