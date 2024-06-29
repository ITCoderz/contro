import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../verify_otp/view/verify_otp_screen.dart';

class LoginController extends GetxController {
  TextEditingController phoneTextController = TextEditingController();

  String? dialCode;

  changeCountryCode({required String dialCode}) {
    this.dialCode = dialCode;
  }

  validate() {
    String completeNumber;
    if (dialCode != null) {
      completeNumber = dialCode! + phoneTextController.text;
    } else {
      completeNumber = "+93${phoneTextController.text}";
    }
    Get.to(
      () => VerifyOtpScreen(
        completeNumber: completeNumber,
      ),
      transition: Transition.fadeIn,
    );
  }
}
