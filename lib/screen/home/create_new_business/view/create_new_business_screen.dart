import 'package:contro/generated/assets.dart';
import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/create_new_business/components/create_new_business_components.dart';
import 'package:contro/screen/home/create_new_business/controller/create_new_business_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../dashboard_new/view/dashboard_new_screen.dart';

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
                      childWidget: Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () {
                                return SelectionTileComponent(
                                  isSelected: createNewBusinessController
                                      .isIndividualSelected.value,
                                  title: "Individual",
                                  descriptionTextOne:
                                      'When signing up as a sole trader, please choose "Individual" as your business type.',
                                  onTapFunction: () {
                                    createNewBusinessController
                                        .toggleIndividualSelected(val: true);
                                  },
                                  imageAsset: createNewBusinessController
                                          .isIndividualSelected.value
                                      ? Assets
                                          .iconsNewBusinessIndividualSelected
                                      : Assets
                                          .iconsNewBusinessIndividualUnselected,
                                );
                              },
                            ),
                          ),
                          10.pw,
                          Expanded(
                            child: Obx(
                              () {
                                return SelectionTileComponent(
                                  isSelected: createNewBusinessController
                                      .isCorporateSelected.value,
                                  title: "Corporate",
                                  descriptionTextOne:
                                      'When signing up as a corporate entity, please choose "Company" as your business type.',
                                  onTapFunction: () {
                                    createNewBusinessController
                                        .toggleCorporateSelected(val: true);
                                  },
                                  imageAsset: createNewBusinessController
                                          .isCorporateSelected.value
                                      ? Assets
                                          .iconsNewBusinessCoorporateSelected
                                      : Assets
                                          .iconsNewBusinessCoorporateUnselected,
                                );
                              },
                            ),
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
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Business Nature",
                      childWidget: CustomTextField(
                        textEditingController: createNewBusinessController
                            .businessNatureController,
                        hintText: "Select Business Nature",
                        readOnly: true,
                        needSuffix: true,
                        suffixWidget: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              elevation: 0.0,
                              backgroundColor: CColors.whiteColor,
                              enableDrag: true,
                              showDragHandle: true,
                              isScrollControlled: true,
                              constraints: BoxConstraints(
                                  maxHeight: context.height * 0.8),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: const SizedBox.shrink(),
                                );
                              },
                            );
                            Get.to(
                                () => const BusinessCategorySelectionWidget());
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Verify Personal Information",
                      childWidget: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: SvgPicture.asset(
                              Assets.iconsPickImageIcon,
                              height: 24,
                            ),
                          ),
                          10.pw,
                          const Expanded(
                              child: Column(
                            children: [
                              Text(
                                "Upload a clear copy of your valid passport and recent bank statement\n\nFile must not be more than 10MB in JPG, JPEG, PNG or PDF format.",
                                style: CustomTextStyles.greyTwoColor412,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Email",
                      childWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            textEditingController:
                                createNewBusinessController.emailController,
                            hintText: "Enter email",
                          ),
                          10.ph,
                          const Text(
                            "Verification Code",
                            style: CustomTextStyles.darkGreyColor414,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController: createNewBusinessController
                                .verificationCodeController,
                            suffixMinWidth: 90,
                            needSuffix: true,
                            suffixWidget: TextButton(
                              onPressed: () {},
                              child: const FittedBox(
                                child: Text(
                                  "Send Code",
                                  style: CustomTextStyles.blueThreeColor412,
                                ),
                              ),
                            ),
                            hintText: "Enter Verification Code",
                          ),
                        ],
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
        child: Obx(() {
          bool areAllFieldsFilled =
              createNewBusinessController.areAllFieldsFilled();
          debugPrint(areAllFieldsFilled.toString());
          return CustomElevatedButton(
            buttonText: "Submit for Review",
            onPressedFunction: areAllFieldsFilled
                ? () {
                    Get.offAll(
                      () => const DashboardNewScreen(),
                      transition: Transition.fadeIn,
                    );
                  }
                : null,
            needShadow: false,
            backgroundColor: areAllFieldsFilled
                ? CColors.purpleAccentColor
                : CColors.lightGreyColor,
            textStyle: areAllFieldsFilled
                ? CustomTextStyles.white414
                : CustomTextStyles.greyTwoColor414,
          );
        }),
      ),
    );
  }
}
