import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xicom_test_rohit/image_list/controller.dart';

class ImageListView extends GetView<ImageListViewController> {
  const ImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    var state = controller.state;
    // return const Center(child: Text("Jai Shree Ram"),);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: Obx(
        ()=> CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = state.imageList[index];
                    if (item.xtImage != null && item.xtImage!.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            controller.goToDetailPage(item);
                          },
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 100,
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: Image.network(item.xtImage!),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                  childCount: state.imageList.length,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: (){
                    state.offSet.value += 1;
                    controller.
                    getImageList();
                  },
                  child: const Text("Click here to load more..."),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
