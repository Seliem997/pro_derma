class ProfileModel{
  int? code;
  ProfileData? profileData;

  ProfileModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    profileData = json['data'] != null ? ProfileData.fromJson(json['data']) : null ;
  }
}

class ProfileData{
  int? id;
  String? userName;
  String? email;
  String? phone;
  List<ProfileDataAddress> addressData=[];

  ProfileData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userName = json['username'];
    email = json['email'];
    phone = json['phone'];
    json['address'].forEach((element){
      addressData.add(ProfileDataAddress.fromJson(element));
    });
  }
}

class ProfileDataAddress{
  int? id;
  String? countryId;
  String? country;
  String? governmentId;
  String? government;
  String? cityId;
  String? city;
  String? address;
  String? latitude;
  String? longitude;

  ProfileDataAddress.fromJson(Map<String, dynamic> json){
    id = json['id'];
    countryId = json['country_id'];
    country = json['country'];
    governmentId = json['government_id'];
    government = json['government'];
    cityId = json['city_id'];
    city = json['city'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}