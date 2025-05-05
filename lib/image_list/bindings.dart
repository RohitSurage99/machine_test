import 'package:get/get.dart';
import 'package:xicom_test_rohit/image_list/controller.dart';

class ImageListViewBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ImageListViewController>(() => ImageListViewController());
    // TODO: implement dependencies
  }

}