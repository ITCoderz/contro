import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountInformationLandingController extends GetxController {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController businessRegistrationNumberController =
      TextEditingController();
  TextEditingController businessNatureController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();

  bool isReadOnly = true;

  toggleEdit() {
    isReadOnly = !isReadOnly;
    update();
  }

  @override
  void onInit() {
    companyNameController.text = "Extrabread Sdn Bhd";
    businessRegistrationNumberController.text = "1512778-U";
    businessNatureController.text = "Selling Products";
    contactPersonController.text = "Wesley Teoh";
    super.onInit();
  }
}
