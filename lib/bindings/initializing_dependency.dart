import 'package:contro/screen/home/settings/signin_and_security/edit_email_controller/controller/edit_email_controller.dart';
import 'package:get/get.dart';

import '../screen/auth/login_screen/controller/login_controller.dart';
import '../screen/auth/splash/controller/splash_controller.dart';
import '../screen/auth/verify_otp/controller/verify_otp_controller.dart';
import '../screen/home/activities/activity_details/controller/activity_detail_controller.dart';
import '../screen/home/activities/activity_filter/controller/activity_filter_controller.dart';
import '../screen/home/activities/activity_landing/controller/activity_landing_controller.dart';
import '../screen/home/chat/chat_landing/controller/chat_landing_controller.dart';
import '../screen/home/chat/messages_screen/controller/messages_controller.dart';
import '../screen/home/create_new_business/controller/create_new_business_controller.dart';
import '../screen/home/dashboard/controller/dashboard_controller.dart';
import '../screen/home/dashboard_new/controller/dashboard_new_controller.dart';
import '../screen/home/item/add_location/controller/add_location_controller.dart';
import '../screen/home/item/add_new_item/controller/add_new_item_controller.dart';
import '../screen/home/item/create_variations/controller/create_variations_controller.dart';
import '../screen/home/item/item_filters/controller/item_filters_controller.dart';
import '../screen/home/item/item_landing/controller/item_landing_controller.dart';
import '../screen/home/item/set_pick_up_delivery/controller/set_pick_up_delivery_controller.dart';
import '../screen/home/item/set_price_and_inventory/controller/set_price_and_inventory_controller.dart';
import '../screen/home/settings/account_information/account_information_landing/controller/account_information_controller.dart';
import '../screen/home/settings/account_information/contact_person/controller/contact_person_controller.dart';
import '../screen/home/settings/qr_codes/connect_to/controller/connect_to_controller.dart';
import '../screen/home/settings/qr_codes/create_qr_code/controller/create_qr_code_controller.dart';
import '../screen/home/settings/qr_codes/qr_codes_landing/controller/qr_codes_landing_controller.dart';
import '../screen/home/settings/qr_codes/qr_filter/controller/qr_filter_controller.dart';
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
    Get.lazyPut(
      () => MessagesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ActivityLandingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ActivityFilterController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ActivityDetailController(),
      fenix: true,
    );
    Get.lazyPut(
      () => QrFilterController(),
      fenix: true,
    );
    Get.lazyPut(
      () => QrCodesLandingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateQrCodeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ConnectToController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ItemLandingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ItemFilterController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddNewItemController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateVariationsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SetPriceAndInventoryController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SetPickUpDeliveryController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddLocationController(),
      fenix: true,
    );
  }
}
