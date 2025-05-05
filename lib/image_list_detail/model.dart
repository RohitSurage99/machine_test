import 'dart:io';
import 'package:dio/dio.dart';

class ImageDetailRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  File? userImage;

  ImageDetailRequestModel(
      {this.firstName, this.lastName, this.email, this.phone, this.userImage});

  ImageDetailRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    userImage = json['user_image'];
  }

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['user_image'] =  await MultipartFile.fromFile(userImage!.path);
    return data;
  }
}
