

import 'dart:typed_data';

class StudentModelClass{
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? password;
  String? email;
  Uint8List? image;



  StudentModelClass({
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNo,
    this.password,
    this.image
});



  // ToDo Convert JsonObject to Model Class Instance Object to use it in Flutter
  StudentModelClass.fromJson(Map<String, dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    password = json['password'];
    image = json['image'];
  }

  // ToDo Convert Model Class Instance to Json Object to use it in Database
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNo'] = mobileNo;
    data['password'] = password;
    data['image'] = image;
    return data;
  }
}