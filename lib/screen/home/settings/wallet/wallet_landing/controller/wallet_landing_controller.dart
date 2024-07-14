import 'package:get/get.dart';

class WalletLandingController extends GetxController {
  final selectedIndex = 0.obs;

  toggleFilter({required int index}) {
    selectedIndex.value = index;
  }

  final selectedTransactionTypeIndex = 0.obs;

  toggleTransactionType({required int index}) {
    selectedTransactionTypeIndex.value = index;
  }

  final selectedSortedByIndex = 0.obs;

  toggleSortedByFilter({required int index}) {
    selectedSortedByIndex.value = index;
  }
}
