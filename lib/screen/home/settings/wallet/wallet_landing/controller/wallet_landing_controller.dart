import 'package:get/get.dart';

class WalletLandingController extends GetxController {
  final selectedIndex = 0.obs;

  toggleFilter({required int index}) {
    selectedIndex.value = index;
  }
}
