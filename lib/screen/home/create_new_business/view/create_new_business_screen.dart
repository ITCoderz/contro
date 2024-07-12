import 'package:contro/generated/assets.dart';
import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/create_new_business/components/create_new_business_components.dart';
import 'package:contro/screen/home/create_new_business/controller/create_new_business_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../reusable_widgets/custom_dialogs/verify_dialogs.dart';
import '../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/constants/constant_lists.dart';
import '../../dashboard_new/view/dashboard_new_screen.dart';
import 'package:dotted_border/dotted_border.dart';

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
                      child: Obx(() {
                        return Text(
                          createNewBusinessController.isIndividualSelected.value
                              ? "For compliance purposes only, we may need to verify your personal information. This information will never be shared outside of our secured services."
                              : "For compliance purposes only, we may verify your company information. This information will never be shared or displayed publicly on Contro.",
                          style: CustomTextStyles.white311,
                        );
                      }),
                    ),
                    10.ph,
                    Container(
                      width: context.width,
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
                            "Instant App Name",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          5.ph,
                          CustomTextField(
                            textEditingController:
                                createNewBusinessController.appNameController,
                            hintText: "Instant App Name",
                            onChangedFunction: (val) {
                              createNewBusinessController
                                  .enableReviewFunction();
                            },
                          ),
                          10.ph,
                          Obx(
                            () {
                              return createNewBusinessController
                                      .isIndividualSelected.value
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                "First Name",
                                                style: CustomTextStyles
                                                    .darkGreyColor412,
                                              ),
                                              5.ph,
                                              CustomTextField(
                                                textEditingController:
                                                    createNewBusinessController
                                                        .firstNameController,
                                                hintText: "First Name",
                                                onChangedFunction: (val) {
                                                  createNewBusinessController
                                                      .enableReviewFunction();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        15.pw,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                "Last Name",
                                                style: CustomTextStyles
                                                    .darkGreyColor412,
                                              ),
                                              5.ph,
                                              CustomTextField(
                                                textEditingController:
                                                    createNewBusinessController
                                                        .lastNameController,
                                                hintText: "Last Name",
                                                onChangedFunction: (val) {
                                                  createNewBusinessController
                                                      .enableReviewFunction();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          Obx(
                            () {
                              return createNewBusinessController
                                      .isCorporateSelected.value
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        15.ph,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              "Company Name",
                                              style: CustomTextStyles
                                                  .darkGreyColor412,
                                            ),
                                            5.ph,
                                            CustomTextField(
                                              textEditingController:
                                                  createNewBusinessController
                                                      .companyNameController,
                                              hintText: "Company Name",
                                              onChangedFunction: (val) {
                                                createNewBusinessController
                                                    .enableReviewFunction();
                                              },
                                            ),
                                          ],
                                        ),
                                        15.ph,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              "Business Registration Number",
                                              style: CustomTextStyles
                                                  .darkGreyColor412,
                                            ),
                                            5.ph,
                                            CustomTextField(
                                              textEditingController:
                                                  createNewBusinessController
                                                      .businessRegistrationNumberController,
                                              hintText:
                                                  "Business Registration Number",
                                              onChangedFunction: (val) {
                                                createNewBusinessController
                                                    .enableReviewFunction();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          15.ph,
                          const Text(
                            "Business Nature",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          5.ph,
                          CustomTextField(
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
                                  // showDragHandle: true,
                                  isScrollControlled: true,
                                  constraints: BoxConstraints(
                                      maxHeight: context.height * 0.8),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
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
                                            .bottom,
                                      ),
                                      child: Container(
                                        height: context.height,
                                        width: context.width,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: SingleChildScrollView(
                                          child: AnimationLimiter(
                                            child: Column(
                                              children: AnimationConfiguration
                                                  .toStaggeredList(
                                                duration: const Duration(
                                                    milliseconds: 375),
                                                childAnimationBuilder:
                                                    (widget) => SlideAnimation(
                                                  horizontalOffset: 50.0,
                                                  child: FadeInAnimation(
                                                    child: widget,
                                                  ),
                                                ),
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 5,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                          color: CColors
                                                              .greyTwoColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                  ),
                                                  20.ph,
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        icon: const Icon(
                                                          Icons.close_rounded,
                                                          color: CColors
                                                              .darkGreyColor,
                                                        ),
                                                      ),
                                                      5.pw,
                                                      const Text(
                                                        "Category.",
                                                        style: CustomTextStyles
                                                            .darkGreyColor620,
                                                      ),
                                                    ],
                                                  ).alignWidget(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                  10.ph,
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: ConstantLists
                                                        .categorySelectionList
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return AnimationConfiguration
                                                          .staggeredList(
                                                        position: index,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    375),
                                                        child: SlideAnimation(
                                                          verticalOffset: 50.0,
                                                          child:
                                                              FadeInAnimation(
                                                            child:
                                                                CategorySelectionTile(
                                                              onTapFunction:
                                                                  () {
                                                                createNewBusinessController.addBusinessCategory(
                                                                    ConstantLists
                                                                        .categorySelectionList[
                                                                            index]
                                                                        .title);
                                                              },
                                                              categorySelectionModel:
                                                                  ConstantLists
                                                                          .categorySelectionList[
                                                                      index],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12,
                              ),
                            ),
                          ),
                          15.ph,
                          const Text(
                            "Verify Personal Information",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          5.ph,
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(5),
                            dashPattern: const [6, 3],
                            color: CColors.greyTwoColor.withOpacity(0.3),
                            strokeWidth: 1.5,
                            child: Container(
                              width: context.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CColors.scaffoldColor,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  25.ph,
                                  SvgPicture.asset(
                                    Assets.iconsCloudUploadIcon,
                                    height: 70,
                                    colorFilter: const ColorFilter.mode(
                                      CColors.greyTwoColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  5.ph,
                                  const Text(
                                    "*Upload a clear copy of your valid passport and recent bank statement",
                                    style: CustomTextStyles.darkGreyTwoColor412,
                                    textAlign: TextAlign.center,
                                  ),
                                  10.ph,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Note:",
                                        style: CustomTextStyles.greyTwoColor410,
                                      ),
                                      2.pw,
                                      const Expanded(
                                        child: Text(
                                          "File must not be more than 10MB in JPG, JPEG, PNG or PDF format.",
                                          style:
                                              CustomTextStyles.greyTwoColor410,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.ph,
                    WhiteContainerTitleBackground(
                      radius: 0,
                      titleString: "Email",
                      childWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            textEditingController:
                                createNewBusinessController.emailController,
                            hintText: "Enter email",
                            onChangedFunction: (val) {
                              createNewBusinessController
                                  .enableReviewFunction();
                            },
                          ),
                          10.ph,
                          const Text(
                            "Verification Code",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          10.ph,
                          CustomTextField(
                            textEditingController: createNewBusinessController
                                .verificationCodeController,
                            suffixMinWidth: 90,
                            needSuffix: true,
                            suffixWidget: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => VerifyDialog(
                                    confirmFunction: () {
                                      Get.back();
                                    },
                                  ),
                                );
                              },
                              child: const FittedBox(
                                child: Text(
                                  "Send Code",
                                  style: CustomTextStyles.blueThreeColor412,
                                ),
                              ),
                            ),
                            hintText: "Enter Verification Code",
                            onChangedFunction: (val) {
                              createNewBusinessController
                                  .enableReviewFunction();
                            },
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
          return CustomElevatedButton(
            buttonText: "Submit for Review",
            onPressedFunction:
                createNewBusinessController.isReviewButtonEnabled.value
                    ? () {
                        Get.offAll(
                          () => const DashboardNewScreen(),
                          transition: Transition.fadeIn,
                        );
                      }
                    : null,
            needShadow: false,
            backgroundColor:
                createNewBusinessController.isReviewButtonEnabled.value
                    ? CColors.purpleAccentColor
                    : CColors.lightGreyColor,
            textStyle: createNewBusinessController.isReviewButtonEnabled.value
                ? CustomTextStyles.white414
                : CustomTextStyles.greyTwoColor414,
          );
        }),
      ),
    );
  }
}
