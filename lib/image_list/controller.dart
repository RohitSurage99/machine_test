import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:xicom_test_rohit/constants.dart';
import 'package:xicom_test_rohit/image_list/api.dart';
import 'package:xicom_test_rohit/image_list/model.dart';
import 'package:xicom_test_rohit/image_list/state.dart';
import 'package:xicom_test_rohit/routes/app_pages.dart';

import 'package:xicom_test_rohit/routes/app_routes.dart';

class ImageListViewController extends GetxController{

  var state = ImageListViewState();

  @override
  void onInit() {
    // TODO: implement onInit
    getImageList();
    super.onInit();
  }


  void goToDetailPage(Images image)async{

    Get.toNamed(AppPages.ImageListDetail, parameters: {
      ParamKeys.SELECTED_IMAGE: image.xtImage!
    });

  }

  Future<void> getImageList()async{

    try{

      ImageListViewRequestModel param = ImageListViewRequestModel();
      param.userId = "108";
      param.offset = state.offSet.value.toString();
      param.type = "popular";

      if (kDebugMode) {
        print("... image param -> ${param.toJson()}");
      }
      EasyLoading.show();
      var res = await ImageListViewApi().getImages(params: param);
      EasyLoading.dismiss();
      if (kDebugMode) {
        print("...image list -> ${res.toJson()}");
      }

      if(res.images != null && res.images!.isNotEmpty){
        for(Images image in res.images!){
          if(!state.imageList.contains(image)) {
            state.imageList.insert(state.imageList.length, image);
          }
        }
      }

    }catch(e){
      EasyLoading.dismiss();
      throw Exception(e);
    }

  }
}