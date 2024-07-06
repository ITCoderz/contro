import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateNewBusinessController extends GetxController {
  final isIndividualSelected = true.obs;
  final isCorporateSelected = false.obs;
  TextEditingController appNameController = TextEditingController();
  TextEditingController businessOwnerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController businessNatureController = TextEditingController();

  // Observables to track field completion
  var isAppNameFilled = false.obs;
  var isBusinessOwnerNameFilled = false.obs;
  var isEmailFilled = false.obs;
  var isVerificationCodeFilled = false.obs;
  var isBusinessNatureFilled = false.obs;

  addBusinessCategory(value){
    businessNatureController.text=value;
    update();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    // Listen to text changes and update observables
    appNameController.addListener(() {
      isAppNameFilled.value = appNameController.text.isNotEmpty;
    });
    businessOwnerNameController.addListener(() {
      isBusinessOwnerNameFilled.value = businessOwnerNameController.text.isNotEmpty;
    });
    emailController.addListener(() {
      isEmailFilled.value = emailController.text.isNotEmpty;
    });
    verificationCodeController.addListener(() {
      isVerificationCodeFilled.value = verificationCodeController.text.isNotEmpty;
    });
    businessNatureController.addListener(() {
      isBusinessNatureFilled.value = businessNatureController.text.isNotEmpty;
    });
  }

  // Function to check if all fields are filled
  bool areAllFieldsFilled() {
    return isAppNameFilled.value &&
        isBusinessOwnerNameFilled.value &&
        isEmailFilled.value &&
        isBusinessNatureFilled.value &&
        isVerificationCodeFilled.value;
  }

  toggleIndividualSelected({required bool val}) {
    isIndividualSelected.value = val;
    isCorporateSelected.value = !val;
  }

  toggleCorporateSelected({required bool val}) {
    isCorporateSelected.value = val;
    isIndividualSelected.value = !val;
  }

}
