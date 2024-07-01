import 'package:contro/reusable_widgets/custom_back_title.dart';
import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/settings/contact_person/controller/contact_person_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class ContactPersonScreen extends StatelessWidget {
  const ContactPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactPersonController = Get.find<ContactPersonController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
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
                              title: "Contact Person.",
                            ),
                            20.ph,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: CColors.whiteColor,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Enter New Contact Person",
                                    style: CustomTextStyles.darkGreyColor414,
                                  ),
                                  10.ph,
                                  CustomTextField(
                                    textEditingController:
                                        contactPersonController
                                            .contactPersonController,
                                    hintText: "Enter Contact Person Name",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    const Spacer(),
                    10.ph,
                    CustomElevatedButton(
                      onPressedFunction: () {},
                      buttonText: "Confirm",
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
