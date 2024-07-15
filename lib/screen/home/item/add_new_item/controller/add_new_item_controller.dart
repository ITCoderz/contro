import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../create_variations/view/create_variations_screen.dart';

class AddNewItemController extends GetxController {
  final categoryString = "Products".obs;
  final multipleVariations = false.obs;
  final isSubmitForReviewEnabled = false.obs;
  TextEditingController productNameTextController = TextEditingController();
  TextEditingController skuTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController tagTextController = TextEditingController();
  TextEditingController priceRmTextController = TextEditingController();
  TextEditingController inventoryTextController = TextEditingController();
  TextEditingController priceRmFromTextController = TextEditingController();
  TextEditingController priceRmToTextController = TextEditingController();

  changeCategoryString({required String val}) {
    categoryString.value = val;
  }

  toggleMultipleVariations() {
    if (multipleVariations.value) {
      multipleVariations.value = false;
    } else {
      Get.to(
        () => const CreateVariationsScreen(),
        transition: Transition.fadeIn,
      );
    }
  }

  toggleEnableSubmitForReview() {
    if (multipleVariations.value) {
      if (productNameTextController.text.isNotEmpty &&
          skuTextController.text.isNotEmpty &&
          descriptionTextController.text.isNotEmpty &&
          tagTextController.text.isNotEmpty &&
          priceRmFromTextController.text.isNotEmpty &&
          priceRmToTextController.text.isNotEmpty &&
          inventoryTextController.text.isNotEmpty) {
        isSubmitForReviewEnabled.value = true;
      } else {
        isSubmitForReviewEnabled.value = false;
      }
    } else {
      if (productNameTextController.text.isNotEmpty &&
          skuTextController.text.isNotEmpty &&
          descriptionTextController.text.isNotEmpty &&
          tagTextController.text.isNotEmpty &&
          priceRmTextController.text.isNotEmpty &&
          inventoryTextController.text.isNotEmpty) {
        isSubmitForReviewEnabled.value = true;
      } else {
        isSubmitForReviewEnabled.value = false;
      }
    }
  }
}
