import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewBusinessController extends GetxController {
  final isIndividualSelected = true.obs;
  final isCorporateSelected = false.obs;
  TextEditingController appNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController businessRegistrationNumberController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController businessNatureController = TextEditingController();
  final isReviewButtonEnabled = false.obs;
  List<File> images = [];
  ImagePicker imagePicker = ImagePicker();

  getMultipleImages() async {
    final pickedImages = await imagePicker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      for (var xFileImage in pickedImages) {
        images.add(File(xFileImage.path));
      }

      update();
      debugPrint(images.length.toString());
    }
  }

  removeImage({required int index}) {
    images.removeAt(index);
    update();
  }

  enableReviewFunction() {
    if (isIndividualSelected.value) {
      if (appNameController.text.isNotEmpty &&
          firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          businessNatureController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          verificationCodeController.text.isNotEmpty) {
        isReviewButtonEnabled.value = true;
      }
    }
    if (isCorporateSelected.value) {
      if (appNameController.text.isNotEmpty &&
          companyNameController.text.isNotEmpty &&
          businessNatureController.text.isNotEmpty &&
          businessNatureController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          verificationCodeController.text.isNotEmpty) {
        isReviewButtonEnabled.value = true;
      }
    }
  }

  addBusinessCategory(value) {
    businessNatureController.text = value;
    update();
    enableReviewFunction();
    Get.back();
  }

  toggleIndividualSelected({required bool val}) {
    isIndividualSelected.value = val;
    isCorporateSelected.value = !val;
    enableReviewFunction();
  }

  toggleCorporateSelected({required bool val}) {
    isCorporateSelected.value = val;
    isIndividualSelected.value = !val;
    enableReviewFunction();
  }
}
