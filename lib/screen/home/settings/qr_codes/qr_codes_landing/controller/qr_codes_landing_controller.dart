import 'package:contro/utils/constants/constant_lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodesLandingController extends GetxController {
  final selectedIndex = 0.obs;
  final isRefreshed = false.obs;
  late List<ValueNotifier<bool>> activeValueBoolList;

  toggleFilter({required int index}) {
    selectedIndex.value = index;
  }

  toggleRefreshed() {
    isRefreshed.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    activeValueBoolList = List.generate(
      ConstantLists.qrCodeModelList.length,
      (index) => ValueNotifier<bool>(false),
    );
  }

  final selectedQrIndex = 0.obs;

  toggleQrFilter({required int index}) {
    selectedQrIndex.value = index;
  }

  final selectedSortedByIndex = 0.obs;

  toggleSortedByFilter({required int index}) {
    selectedSortedByIndex.value = index;
  }
}
