import 'package:get/get.dart';

import '../screen/auth/login_screen/controller/login_controller.dart';
import '../screen/auth/splash/controller/splash_controller.dart';
import '../screen/auth/verify_otp/controller/verify_otp_controller.dart';
import '../screen/home/create_new_business/controller/create_new_business_controller.dart';

class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => VerifyOtpController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateNewBusinessController(),
      fenix: true,
    );
  }
}
