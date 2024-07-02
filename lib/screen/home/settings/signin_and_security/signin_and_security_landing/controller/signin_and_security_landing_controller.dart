import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInAndSecurityController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    phoneNumberController.text = '+60*****5557';
    emailController.text = 'wesley@contro.me';
    super.onInit();
  }
}
