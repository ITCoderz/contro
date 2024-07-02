import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhoneNumberController extends GetxController {
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();
  final viewText = false.obs;

  toggleViewText() {
    viewText.value = true;
  }
}
