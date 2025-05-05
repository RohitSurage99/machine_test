import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ImageListDetailState{
  RxBool isLoading = false.obs;
  RxString image = "".obs;

  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  var attachment = Rx<File?>(null);

}