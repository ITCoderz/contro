import 'package:contro/models/category_selection_model/category_selection_model.dart';
import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/screen/home/settings/account_information/account_information_landing/view/account_information_screen.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import '../../../item/item_landing/view/item_landing_screen.dart';
import '../../qr_codes/qr_codes_landing/view/qr_codes_landing_screen.dart';
import '../../signin_and_security/signin_and_security_landing/view/sign_in_and_security_screen.dart';
import '../../theme/view/theme_screen.dart';
import '../../wallet/wallet_landing/view/wallet_landing_screen.dart';

class SettingsLandingScreen extends StatelessWidget {
  const SettingsLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          height: context.height,
          width: context.width,
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    5.ph,
                    const Text(
                      "Setting.",
                      style: CustomTextStyles.darkGreyColor622,
                    ),
                    20.ph,
                    CategorySelectionTile(
                      onTapFunction: () {
                        Get.to(
                          () => const AccountInformationLandingScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsProfileIcon,
                        title: "Account Information",
                      ),
                    ),
                    CategorySelectionTile(
                      onTapFunction: () {
                        Get.to(
                          () => const SignInAndSecurityScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsSignInAndSecurityIcon,
                        title: "Sign in & Security",
                      ),
                    ),
                    10.ph,
                    CategorySelectionTile(
                      onTapFunction: () {
                        Get.to(
                          () => const WalletLandingScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsWalletIcon,
                        title: "Wallet",
                      ),
                    ),
                    10.ph,
                    CategorySelectionTile(
                      onTapFunction: () {
                        Get.to(
                          () => const ItemLandingScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsProductAndServicesIcon,
                        title: "Products & Services",
                      ),
                    ),
                    CategorySelectionTile(
                      onTapFunction: () {
                        Get.to(
                          () => const QrCodesLandingScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsQrcodeIcon,
                        title: "QR Codes",
                      ),
                    ),
                    CategorySelectionTile(
                      onTapFunction: () {},
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsSpeakerphone,
                        title: "Marketing",
                      ),
                    ),
                    10.ph,
                    CategorySelectionTile(
                      onTapFunction: () {
                        Get.to(
                          () => const ThemeScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsThemesIcon,
                        title: "Themes",
                      ),
                    ),
                    CategorySelectionTile(
                      onTapFunction: () {},
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsPaymentAndSubscriptionsIcon,
                        title: "Payment & Subscriptions",
                      ),
                    ),
                    CategorySelectionTile(
                      onTapFunction: () {},
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsLanguagesIcon,
                        title: "Language",
                      ),
                    ),
                    CategorySelectionTile(
                      onTapFunction: () {},
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsAboutIcon,
                        title: "About",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 4,
      ),
    );
  }
}
