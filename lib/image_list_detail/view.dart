import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xicom_test_rohit/image_list_detail/controller.dart';

class ImageListDetailView extends GetView<ImageListDetailController> {
  const ImageListDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var state = controller.state;
    // return const Center(child: Text("Jai Shree Ram"),);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Obx(
        () => state.isLoading.value
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: state.formKey,
                      child: Column(
                        children: [
                          //image container
                          Container(
                            constraints: BoxConstraints(
                              minHeight: 100,
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: state.attachment.value == null
                                ? Image.network(state.image.value)
                                : Image.file(state.attachment.value!),
                          ),
                          TextFormField(
                            controller: state.firstNameController,
                            decoration:
                                const InputDecoration(labelText: 'First Name'),
                            validator: (value) =>
                                value!.isEmpty ? 'Enter first name' : null,
                          ),
                          TextFormField(
                            controller: state.lastNameController,
                            decoration:
                                const InputDecoration(labelText: 'Last Name'),
                            validator: (value) {
                              return value!.isEmpty ? 'Enter last name' : null;
                            },
                          ),
                          TextFormField(
                            controller: state.emailController,
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            validator: (value) =>
                                value!.isEmpty ? 'Enter email' : null,
                          ),
                          TextFormField(
                            controller: state.phoneController,
                            decoration:
                                const InputDecoration(labelText: 'Phone'),
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'Enter phone number'
                                  : null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (state.formKey.currentState!.validate()) {
                                if (true) {
                                  print("validated");
                                  controller.submitForm();
                                }
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
