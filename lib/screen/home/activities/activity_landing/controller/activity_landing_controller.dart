import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';

class ActivityLandingController extends GetxController {
  final selectedIndex = 0.obs;
  final isRefreshed = false.obs;
  PaginatorController paginationActivityController = PaginatorController();

  toggleFilter({required int index}) {
    selectedIndex.value = index;
  }

  toggleRefreshed() {
    isRefreshed.value = true;
  }

  final selectedActivityStatusIndex = 0.obs;

  toggleActivityStatusType({required int index}) {
    selectedActivityStatusIndex.value = index;
  }

  final selectedSortedByIndex = 0.obs;

  toggleSortedByFilter({required int index}) {
    selectedSortedByIndex.value = index;
  }
}
