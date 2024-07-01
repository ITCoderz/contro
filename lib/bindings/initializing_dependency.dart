import 'package:get/get.dart';

import '../screen/auth/login_screen/controller/login_controller.dart';
import '../screen/auth/splash/controller/splash_controller.dart';
import '../screen/auth/verify_otp/controller/verify_otp_controller.dart';
import '../screen/home/create_new_business/controller/create_new_business_controller.dart';
import '../screen/home/dashboard/controller/dashboard_controller.dart';
import '../screen/home/dashboard_new/controller/dashboard_new_controller.dart';
import '../screen/home/settings/account_information/controller/account_information_controller.dart';
import '../screen/home/settings/contact_person/controller/contact_person_controller.dart';
import '../screen/home/settings/settings_landing/controller/settings_landing_controller.dart';

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
    Get.lazyPut(
      () => DashboardNewController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DashboardController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SettingsLandingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ContactPersonController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AccountInformationController(),
      fenix: true,
    );
  }
}
