import 'package:get/get.dart';
import 'package:xicom_test_rohit/image_list_detail/controller.dart';

class ImageListDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ImageListDetailController());
    // TODO: implement dependencies
  }

}