class LoginModel{
  int? status;
  String? message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['code'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class UserData{
  late String name;
  late String email;
  late String phone;
  late String token;

  UserData.fromJson(Map <String, dynamic> json){
    name = json['username'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }
}