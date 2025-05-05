import 'dart:convert';

import 'package:xicom_test_rohit/constants.dart';

import 'model.dart';
import 'package:dio/dio.dart';
class ImageListViewApi{
  var dio = Dio();

  Future<ImageListViewResponseModel> getImages({ImageListViewRequestModel? params})async{

    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
    );
   dio = Dio(options);
   FormData data = FormData.fromMap(params!.toJson());
    var res = await dio.post(EndPoints.getData, data: data);
    return ImageListViewResponseModel.fromJson(jsonDecode(res.data));

  }


}