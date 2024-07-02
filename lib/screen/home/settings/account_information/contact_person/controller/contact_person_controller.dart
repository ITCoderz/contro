import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactPersonController extends GetxController {
  TextEditingController contactPersonController = TextEditingController();

  @override
  void onInit() {
    contactPersonController.text = "Wesley Teoh";
    super.onInit();
  }
}
