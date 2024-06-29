import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateNewBusinessController extends GetxController {
  final isIndividualSelected = true.obs;

  final isCorporateSelected = false.obs;

  TextEditingController appNameController = TextEditingController();
  TextEditingController businessOwnerNameController = TextEditingController();
  toggleIndividualSelected({required bool val}) {
    isIndividualSelected.value = val;
    isCorporateSelected.value = !val;
  }

  toggleCorporateSelected({required bool val}) {
    isCorporateSelected.value = val;
    isIndividualSelected.value = !val;
  }
}
