import 'package:contro/screen/home/settings/signin_and_security/edit_phone_number/controller/edit_phone_number_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/custom_dialogs/verify_dialogs.dart';
import '../../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../../utils/text_styles/text_styles.dart';

class EditPhoneNumberScreen extends StatelessWidget {
  const EditPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editEmailController = Get.find<EditPhoneNumberController>();
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              title: "Phone Number.",
                            ),
                            20.ph,
                            CustomBackgroundContainer(
                              leftPadding: 10,
                              rightPadding: 10,
                              childWidget: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Enter New Phone Number",
                                    style: CustomTextStyles.darkGreyColor412,
                                  ),
                                  10.ph,
                                  CustomTextField(
                                    textEditingController:
                                        editEmailController.phoneTextController,
                                    hintText: "Phone Number",
                                    keyboardType: TextInputType.phone,
                                    borderRadius: 6,
                                  ),
                                  20.ph,
                                  const Text(
                                    "Verification Code",
                                    style: CustomTextStyles.darkGreyColor412,
                                  ),
                                  10.ph,
                                  CustomTextField(
                                    textEditingController:
                                        editEmailController.codeTextController,
                                    hintText: "Verification Code",
                                    needSuffix: true,
                                    suffixMinWidth: 85,
                                    borderRadius: 6,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => VerifyDialog(
                                            isForPhone: true,
                                            confirmFunction: () {
                                              Get.back();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Send Code",
                                        style: CustomTextStyles.blueTwoColor412,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    const Spacer(),
                    CustomElevatedButton(
                      onPressedFunction: () {
                        Get.back();
                      },
                      buttonText: "Update Phone Number",
                      needShadow: false,
                      textStyle: CustomTextStyles.white414,
                    ),
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
