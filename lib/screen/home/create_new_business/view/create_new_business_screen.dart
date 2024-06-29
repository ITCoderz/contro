import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/create_new_business/components/create_new_business_components.dart';
import 'package:contro/screen/home/create_new_business/controller/create_new_business_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../utils/colors/app_colors.dart';

class CreateNewBusinessScreen extends StatelessWidget {
  const CreateNewBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final createNewBusinessController = Get.find<CreateNewBusinessController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        "Create a New Business",
                        style: CustomTextStyles.darkGreyColor620,
                      ),
                    ),
                    20.ph,
                    const Text(
                      "Tell us about your new ventures.",
                      style: CustomTextStyles.darkGreyColor514,
                    ),
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Business Type",
                      childWidget: Column(
                        children: [
                          Obx(
                            () {
                              return SelectionTileComponent(
                                isSelected: createNewBusinessController
                                    .isIndividualSelected.value,
                                title: "Individual",
                                descriptionTextOne:
                                    'When signing up as a sole trader, please choose "Individual" as your business type.',
                                descriptionTextTwo:
                                    'Please verify your identity using a valid passport and bank account.',
                                onTapFunction: () {
                                  createNewBusinessController
                                      .toggleIndividualSelected(val: true);
                                },
                              );
                            },
                          ),
                          10.ph,
                          Obx(
                            () {
                              return SelectionTileComponent(
                                isSelected: createNewBusinessController
                                    .isCorporateSelected.value,
                                title: "Corporate",
                                descriptionTextOne:
                                    'When signing up as a corporate entity, please choose "Company" as your business type.',
                                descriptionTextTwo:
                                    'Please complete your business verification with a business license.',
                                onTapFunction: () {
                                  createNewBusinessController
                                      .toggleCorporateSelected(val: true);
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    10.ph,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      decoration:
                          const BoxDecoration(color: CColors.darkGreyColor),
                      child: const Text(
                        "For compliance purposes only, we may need to verify your personal information. This information will never be shared outside of our secured services.",
                        style: CustomTextStyles.white311,
                      ),
                    ),
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Instant App Name",
                      subtitleString:
                          "${createNewBusinessController.appNameController.text.length}/120",
                      childWidget: CustomTextField(
                        textEditingController:
                            createNewBusinessController.appNameController,
                        hintText: "Enter Instant App Name",
                      ),
                    ),
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Business Owner Name",
                      childWidget: CustomTextField(
                        textEditingController: createNewBusinessController
                            .businessOwnerNameController,
                        hintText: "Enter your Full Name",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 68,
        color: CColors.whiteColor,
        padding: const EdgeInsets.only(
          top: 10,
          left: 35,
          right: 35,
          bottom: 10,
        ),
        child: CustomElevatedButton(
          buttonText: "Submit for Review",
          onPressedFunction: () {},
          needShadow: false,
          backgroundColor: CColors.lightGreyColor,
          textStyle: CustomTextStyles.greyTwoColor414,
        ),
      ),
    );
  }
}
