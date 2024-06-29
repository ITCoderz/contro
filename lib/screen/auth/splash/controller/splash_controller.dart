import 'package:get/get.dart';

import '../../login_screen/view/login_screen.dart';

class SplashController extends GetxController {
  final animatedToggled = false.obs;
  final opacityToggled = false.obs;

  @override
  void onInit() {
    toggleAnimate();
    super.onInit();
  }

  toggleAnimate() {
    Future.delayed(
      const Duration(
        milliseconds: 100,
      ),
      () {
        animatedToggled.value = true;
        toggleOpacity();
      },
    );
  }

  toggleOpacity() {
    Future.delayed(
      const Duration(
        milliseconds: 1400,
      ),
      () {
        opacityToggled.value = true;
        navigateToLoginScreen();
      },
    );
  }

  navigateToLoginScreen() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Get.offAll(
          () => const LoginScreen(),
          transition: Transition.fadeIn,
        );
      },
    );
  }
}
