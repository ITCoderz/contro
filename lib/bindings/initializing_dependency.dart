import 'package:contro/screen/home/settings/signin_and_security/edit_email_controller/controller/edit_email_controller.dart';
import 'package:get/get.dart';

import '../screen/auth/login_screen/controller/login_controller.dart';
import '../screen/auth/splash/controller/splash_controller.dart';
import '../screen/auth/verify_otp/controller/verify_otp_controller.dart';
import '../screen/home/chat/chat_landing/controller/chat_landing_controller.dart';
import '../screen/home/create_new_business/controller/create_new_business_controller.dart';
import '../screen/home/dashboard/controller/dashboard_controller.dart';
import '../screen/home/dashboard_new/controller/dashboard_new_controller.dart';
import '../screen/home/settings/account_information/account_information_landing/controller/account_information_controller.dart';
import '../screen/home/settings/account_information/contact_person/controller/contact_person_controller.dart';
import '../screen/home/settings/settings_landing/controller/settings_landing_controller.dart';
import '../screen/home/settings/signin_and_security/edit_phone_number/controller/edit_phone_number_controller.dart';
import '../screen/home/settings/signin_and_security/signin_and_security_landing/controller/signin_and_security_landing_controller.dart';
import '../screen/home/settings/theme/controller/theme_controller.dart';
import '../screen/home/settings/wallet/add_bank_account/controller/add_bank_account_controller.dart';
import '../screen/home/settings/wallet/bank_account/controller/bank_account_controller.dart';
import '../screen/home/settings/wallet/wallet_landing/controller/wallet_landing_controller.dart';
import '../screen/home/settings/wallet/withdrawal/controller/withdrawal_controller.dart';

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
      () => AccountInformationLandingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => WalletLandingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => WithdrawalController(),
      fenix: true,
    );
    Get.lazyPut(
      () => BankAccountController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddBankAccountController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignInAndSecurityController(),
      fenix: true,
    );
    Get.lazyPut(
      () => EditPhoneNumberController(),
      fenix: true,
    );
    Get.lazyPut(
      () => EditEmailController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ThemeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ChatLandingController(),
      fenix: true,
    );
  }
}
