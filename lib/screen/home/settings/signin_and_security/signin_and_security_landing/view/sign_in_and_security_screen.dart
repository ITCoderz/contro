import 'package:contro/screen/home/settings/signin_and_security/signin_and_security_landing/controller/signin_and_security_landing_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../edit_email_controller/view/edit_email_screen.dart';
import '../../edit_phone_number/view/edit_phone_number_screen.dart';

class SignInAndSecurityScreen extends StatelessWidget {
  const SignInAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInAndSecurityController = Get.find<SignInAndSecurityController>();
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
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimationLimiter(
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
                            const CustomBackTitle(
                              title: "Sign in & Security",
                            ),
                            20.ph,
                            TitleContainerWidget(
                              titleString: "Phone Number",
                              subtitleWidget: InkWell(
                                onTap: () {
                                  Get.to(
                                    () => const EditPhoneNumberScreen(),
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
                                textEditingController:
                                    signInAndSecurityController
                                        .phoneNumberController,
                                hintText: "",
                                readOnly: true,
                                keyboardType: TextInputType.phone,
                                textStyle: CustomTextStyles.greyTwoColor412,
                                fillColor: CColors.scaffoldColor,
                              ),
                            ),
                            10.ph,
                            TitleContainerWidget(
                              titleString: "Email",
                              subtitleWidget: InkWell(
                                onTap: () {
                                  Get.to(
                                    () => const EditEmailScreen(),
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
                                textEditingController:
                                    signInAndSecurityController.emailController,
                                hintText: "",
                                readOnly: true,
                                keyboardType: TextInputType.emailAddress,
                                textStyle: CustomTextStyles.greyTwoColor412,
                                fillColor: CColors.scaffoldColor,
                              ),
                            ),
                            10.ph,
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: CColors.whiteColor,
                                  ),
                                  width: context.width,
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Face ID & Passcode",
                                            style: CustomTextStyles
                                                .darkGreyColor414,
                                          ),
                                        ),
                                        20.pw,
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: CColors.darkGreyColor,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
