import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:xicom_test_rohit/image_list/bindings.dart';
import 'package:xicom_test_rohit/image_list_detail/binding.dart';
import 'package:xicom_test_rohit/image_list_detail/view.dart';
import 'package:xicom_test_rohit/routes/app_pages.dart';

import '../image_list/view.dart';

class AppRoutes{
  static final List<GetPage> routes = [
    GetPage(
        name: AppPages.Initial,
        page: () => const ImageListView(),
        binding: ImageListViewBinding()),
    GetPage(
        name: AppPages.ImageListDetail,
        page: () => const ImageListDetailView(),
        binding: ImageListDetailBinding()),
  ];
}