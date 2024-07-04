import 'package:get/get.dart';

class QrFilterController extends GetxController {
  final selectedQrIndex = 0.obs;

  toggleFilter({required int index}) {
    selectedQrIndex.value = index;
  }

  final selectedSortedByIndex = 0.obs;

  toggleSortedByFilter({required int index}) {
    selectedSortedByIndex.value = index;
  }
}
