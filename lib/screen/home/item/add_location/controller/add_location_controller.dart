import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddLocationController extends GetxController {
  TextEditingController searchLocationController = TextEditingController();

  final selectedIndex = 0.obs;

  toggleSelectedIndex({required int index}) {
    selectedIndex.value = index;
  }
}
