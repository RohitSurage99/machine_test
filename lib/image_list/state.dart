import 'package:get/get.dart';

import 'model.dart';

class ImageListViewState{
  RxBool isLoading = false.obs;
  RxInt offSet = 1.obs;

  RxList<Images> imageList = <Images>[].obs;

}