import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../constants.dart';
import 'model.dart';

class ImageListDetailApi {
  Dio dio = Dio();

  Future submitFormApi({ImageDetailRequestModel? param}) async {
    FormData data = FormData.fromMap(await param!.toJson());
    print("...form data -> ${data.fields}");

    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
    );
    dio = Dio(options);
    var res = await dio.post(EndPoints.saveData, data: data);
    return jsonDecode(res.data);
  }

  Future<File> downloadImage(String url) async {
    try {
      EasyLoading.show(status: "Downloading Image...");
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      String fileName = basename(url);
      String filePath = '$tempPath/$fileName';

      Response response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      File file = File(filePath);
      await file.writeAsBytes(response.data);

      EasyLoading.dismiss();
      return file;
    } catch (e) {
      EasyLoading.dismiss();
      print("Error downloading image: $e");
      throw Exception(e);
    }
  }
}
