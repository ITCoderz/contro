import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/create_new_business/view/create_new_business_screen.dart';

class VerifyOtpController extends GetxController {
  final pinKey = GlobalKey<FormState>();

  TextEditingController enterPinController = TextEditingController();

  validateOtp() {
    Get.offAll(
      () => const CreateNewBusinessScreen(),
      transition: Transition.fadeIn,
    );
  }
}
