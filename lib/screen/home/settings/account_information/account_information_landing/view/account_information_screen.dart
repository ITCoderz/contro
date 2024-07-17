import 'package:contro/reusable_widgets/custom_background_container.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../contact_person/view/contact_person_screen.dart';
import '../controller/account_information_controller.dart';

class AccountInformationLandingScreen extends StatelessWidget {
  const AccountInformationLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountInformationController =
        Get.find<AccountInformationLandingController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          height: context.height,
          width: context.width,
          child: GetBuilder<AccountInformationLandingController>(
            builder: (accountInformationController) {
              return SingleChildScrollView(
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
                        10.ph,
                        const CustomBackTitle(
                          title: "Account Information.",
                        ),
                        20.ph,
                        CustomBackgroundContainer(
                          leftPadding: 10,
                          rightPadding: 10,
                          radius: 0,
                          width: context.width,
                          childWidget: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Company Name",
                                style: CustomTextStyles.darkGreyColor413,
                              ),
                              10.ph,
                              CustomTextField(
                                textEditingController:
                                    accountInformationController
                                        .companyNameController,
                                hintText: "Enter Contact Person Name",
                                readOnly:
                                    accountInformationController.isReadOnly,
                                fillColor: CColors.scaffoldColor,
                                borderRadius: 6,
                                textStyle:
                                    CustomTextStyles.lightGreyTwoColor412,
                              ),
                              15.ph,
                              const Text(
                                "Business Registration Number",
                                style: CustomTextStyles.darkGreyColor413,
                              ),
                              10.ph,
                              CustomTextField(
                                textEditingController:
                                    accountInformationController
                                        .businessRegistrationNumberController,
                                hintText: "Enter Business Registration Number",
                                readOnly:
                                    accountInformationController.isReadOnly,
                                fillColor: CColors.scaffoldColor,
                                borderRadius: 6,
                                textStyle:
                                    CustomTextStyles.lightGreyTwoColor412,
                              ),
                              15.ph,
                              const Text(
                                "Business Registration Number",
                                style: CustomTextStyles.darkGreyColor413,
                              ),
                              10.ph,
                              CustomTextField(
                                textEditingController:
                                    accountInformationController
                                        .businessRegistrationNumberController,
                                hintText: "Business Nature",
                                readOnly:
                                    accountInformationController.isReadOnly,
                                fillColor: CColors.scaffoldColor,
                                textStyle:
                                    CustomTextStyles.lightGreyTwoColor412,
                                borderRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        10.ph,
                        TitleContainerWidget(
                          titleString: "Contact Person",
                          subtitleWidget: InkWell(
                            onTap: () {
                              Get.to(
                                () => const ContactPersonScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Text(
                                "Edit",
                                style: CustomTextStyles.blueTwoColor414,
                              ),
                            ),
                          ),
                          childWidget: CustomTextField(
                            textEditingController: accountInformationController
                                .contactPersonController,
                            hintText: "Enter Contact Person",
                            readOnly: accountInformationController.isReadOnly,
                            fillColor: CColors.scaffoldColor,
                            borderRadius: 6,
                            textStyle: CustomTextStyles.lightGreyTwoColor412,
                          ),
                        ),
                        10.ph,
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                          width: context.width,
                          decoration: const BoxDecoration(
                              color: CColors.mildGreenColor),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                Assets.iconsVerifiedIcon,
                                height: 19,
                                width: 19,
                              ),
                              5.pw,
                              const Text(
                                "This account is verified since 04/06/2024.",
                                style: CustomTextStyles.white412,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
