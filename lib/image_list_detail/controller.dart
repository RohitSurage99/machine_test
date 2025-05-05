
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:xicom_test_rohit/constants.dart';
import 'package:xicom_test_rohit/image_list_detail/model.dart';
import 'package:xicom_test_rohit/image_list_detail/state.dart';

import 'api.dart';

class ImageListDetailController extends GetxController {
  var state = ImageListDetailState();


  @override
  Future<void> onReady() async {
    // TODO: implement onReady

    state.isLoading.value = false;
    var data = Get.parameters;
    state.image.value = data[ParamKeys.SELECTED_IMAGE] ?? "";

    if (state.image.value.isNotEmpty) {
      state.attachment.value =
          await ImageListDetailApi().downloadImage(state.image.value);
    }

    if (kDebugMode) {
      print("...image-> ${state.image.value}");
    }

    state.isLoading.value = true;
    super.onReady();
  }

  Future<void> submitForm() async {
    ImageDetailRequestModel param = ImageDetailRequestModel();
    param.firstName = state.firstNameController.text.trim();
    param.lastName = state.lastNameController.text.trim();
    param.email = state.emailController.text.trim();
    param.phone = state.phoneController.text.trim();
    param.userImage = state.attachment.value;

    EasyLoading.show();
    var res = await ImageListDetailApi().submitFormApi(param: param);

    EasyLoading.dismiss();
    if (kDebugMode) {
      print("...save res -> $res");
    }
    if (res['status'] == "success") {
      Get.back();
    }
    Get.snackbar(res['status'].toString().toUpperCase(), res['message']);
  }


}
