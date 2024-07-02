import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEmailController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();
  final viewText = false.obs;

  toggleViewText() {
    viewText.value = true;
  }
}
