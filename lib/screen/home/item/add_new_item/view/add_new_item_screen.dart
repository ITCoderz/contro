import 'package:contro/reusable_widgets/custom_back_title.dart';
import 'package:contro/screen/home/item/add_new_item/controller/add_new_item_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../item_filters/view/item_category_screen.dart';
import '../../set_pick_up_delivery/view/set_pick_up_delivery_screen.dart';
import '../components/add_new_item_components.dart';

class AddNewItemScreen extends StatelessWidget {
  const AddNewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addNewItemController = Get.find<AddNewItemController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
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
                    const CustomBackTitle(title: "Add New Item"),
                    TitleContainerWidget(
                      titleString: "Media",
                      radius: 0,
                      childWidget: DottedBorder(
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
                              const Text(
                                "Note: File must not be more than 10MB .",
                                style: CustomTextStyles.greyTwoColor410,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    10.ph,
                    TitleContainerWidget(
                      titleString: "Category",
                      radius: 0,
                      childWidget: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // Get.to(
                              //   () => const CreateVariationsScreen(),
                              //   transition: Transition.fadeIn,
                              // );
                              showModalBottomSheet(
                                elevation: 0.0,
                                backgroundColor: CColors.whiteColor,
                                enableDrag: true,
                                // showDragHandle: true,
                                isScrollControlled: true,
                                // constraints:
                                //     BoxConstraints(maxHeight: context.height * 0.8),
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
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                        bottom: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 375),
                                        childAnimationBuilder: (widget) =>
                                            SlideAnimation(
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
                                                  color: CColors.greyTwoColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          20.ph,
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                icon: const Icon(
                                                  Icons.close_rounded,
                                                  color: CColors.darkGreyColor,
                                                ),
                                              ),
                                              5.pw,
                                              const Text(
                                                "Category.",
                                                style: CustomTextStyles
                                                    .darkGreyColor618,
                                              ),
                                            ],
                                          ).alignWidget(
                                            alignment: Alignment.centerLeft,
                                          ),
                                          10.ph,
                                          ItemCategorySelectionTile(
                                            onTapFunction: () {
                                              addNewItemController
                                                  .changeCategoryString(
                                                val: "Products",
                                              );
                                              Get.back();
                                            },
                                            imageAsset: Assets.iconsProductIcon,
                                            title: "Products",
                                            description:
                                                "(Tangible Goods, Digital Products, etc...)",
                                          ),
                                          ItemCategorySelectionTile(
                                            onTapFunction: () {
                                              addNewItemController
                                                  .changeCategoryString(
                                                val: "Services",
                                              );
                                              Get.back();
                                            },
                                            imageAsset: Assets.iconsServiceIcon,
                                            title: "Services",
                                            description:
                                                "(Bookings, Cleaning, etc...) ",
                                          ),
                                          40.ph,
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: CColors.scaffoldColor,
                              ),
                              width: context.width,
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () {
                                          return Text(
                                            addNewItemController
                                                .categoryString.value,
                                            style: CustomTextStyles
                                                .darkGreyTwoColor412,
                                          );
                                        },
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
                      ),
                    ),
                    15.ph,
                    const Text(
                      "Item Details",
                      style: CustomTextStyles.darkGreyTwoColor516,
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      radius: 0,
                      topPadding: 15,
                      leftPadding: 10,
                      rightPadding: 10,
                      bottomPadding: 15,
                      width: context.width,
                      childWidget: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product Name",
                            style: CustomTextStyles.darkGreyTwoColor412,
                          ),
                          5.ph,
                          CustomTextField(
                            textEditingController:
                                addNewItemController.productNameTextController,
                            hintText: "Enter Instant App Name",
                            borderRadius: 6,
                            onChangedFunction: (val) {
                              addNewItemController
                                  .toggleEnableSubmitForReview();
                            },
                          ),
                          10.ph,
                          const Text(
                            "SKU",
                            style: CustomTextStyles.darkGreyTwoColor412,
                          ),
                          5.ph,
                          CustomTextField(
                            textEditingController:
                                addNewItemController.skuTextController,
                            hintText: "Enter SKU",
                            borderRadius: 6,
                            onChangedFunction: (val) {
                              addNewItemController
                                  .toggleEnableSubmitForReview();
                            },
                          ),
                          10.ph,
                          const Text(
                            "Description",
                            style: CustomTextStyles.darkGreyTwoColor412,
                          ),
                          5.ph,
                          CustomTextField(
                            textEditingController:
                                addNewItemController.descriptionTextController,
                            hintText:
                                "Enter Description. Try out our new AI tool to help you to bring your product to life.",
                            maxLines: null,
                            minLines: 1,
                            hintMaxLines: 2,
                            keyboardType: TextInputType.multiline,
                            borderRadius: 6,
                            onChangedFunction: (val) {
                              addNewItemController
                                  .toggleEnableSubmitForReview();
                            },
                          ),
                          10.ph,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: CColors.pinkAccentColor),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(Assets.iconsAiGenerativeIcon),
                                2.pw,
                                const Text(
                                  "AI Generative",
                                  style: CustomTextStyles.white412,
                                ),
                              ],
                            ),
                          ).alignWidget(
                            alignment: Alignment.centerRight,
                          ),
                          20.ph,
                          const Text(
                            "Tag (Optional)",
                            style: CustomTextStyles.darkGreyTwoColor412,
                          ),
                          5.ph,
                          CustomTextField(
                            textEditingController:
                                addNewItemController.tagTextController,
                            hintText: "Add Tag",
                            borderRadius: 6,
                            onChangedFunction: (val) {
                              addNewItemController
                                  .toggleEnableSubmitForReview();
                            },
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      radius: 0,
                      topPadding: 15,
                      leftPadding: 10,
                      rightPadding: 10,
                      bottomPadding: 15,
                      width: context.width,
                      childWidget: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Multiple Variations",
                              style: CustomTextStyles.darkGreyTwoColor412,
                            ),
                          ),
                          20.pw,
                          GestureDetector(
                            onTap: () {
                              addNewItemController.toggleMultipleVariations();
                            },
                            child: AbsorbPointer(
                              child: Obx(
                                () {
                                  return AdvancedSwitch(
                                    activeColor: CColors.purpleAccentColor,
                                    inactiveColor: Colors.grey,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    width: 33,
                                    height: 18,
                                    initialValue: addNewItemController
                                        .multipleVariations.value,
                                    enabled: false,
                                    disabledOpacity: 1,
                                    onChanged: (val) {},
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      radius: 0,
                      topPadding: 15,
                      leftPadding: 10,
                      rightPadding: 10,
                      bottomPadding: 15,
                      width: context.width,
                      childWidget: Obx(
                        () {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: addNewItemController
                                    .multipleVariations.value
                                ? [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Variants",
                                          style: CustomTextStyles
                                              .darkGreyTwoColor412,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "Edit",
                                            style: CustomTextStyles
                                                .blueTwoColor412,
                                          ),
                                        ),
                                      ],
                                    ),
                                    5.ph,
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: 2,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              8.ph,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 375),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: VariantItemComponent(
                                                index: index,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ]
                                : [
                                    const Text(
                                      "Price (RM)",
                                      style:
                                          CustomTextStyles.darkGreyTwoColor412,
                                    ),
                                    5.ph,
                                    CustomTextField(
                                      textEditingController:
                                          addNewItemController
                                              .priceRmTextController,
                                      hintText: "0.00",
                                      keyboardType: TextInputType.number,
                                      borderRadius: 6,
                                      onChangedFunction: (val) {
                                        addNewItemController
                                            .toggleEnableSubmitForReview();
                                      },
                                    ),
                                    10.ph,
                                    const Text(
                                      "Inventory",
                                      style:
                                          CustomTextStyles.darkGreyTwoColor412,
                                    ),
                                    5.ph,
                                    CustomTextField(
                                      textEditingController:
                                          addNewItemController
                                              .inventoryTextController,
                                      hintText: "0",
                                      borderRadius: 6,
                                      keyboardType: TextInputType.number,
                                      onChangedFunction: (val) {
                                        addNewItemController
                                            .toggleEnableSubmitForReview();
                                      },
                                    ),
                                  ],
                          );
                        },
                      ),
                    ),
                    Obx(
                      () => addNewItemController.multipleVariations.value
                          ? 10.ph
                          : const SizedBox.shrink(),
                    ),
                    Obx(
                      () => addNewItemController.multipleVariations.value
                          ? CustomBackgroundContainer(
                              radius: 0,
                              topPadding: 15,
                              leftPadding: 10,
                              rightPadding: 10,
                              bottomPadding: 15,
                              width: context.width,
                              childWidget: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Price (RM)",
                                    style: CustomTextStyles.darkGreyTwoColor412,
                                  ),
                                  5.ph,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          textEditingController:
                                              addNewItemController
                                                  .priceRmFromTextController,
                                          hintText: "0.00",
                                          keyboardType: TextInputType.number,
                                          borderRadius: 6,
                                          fillColor: CColors.scaffoldColor,
                                          onChangedFunction: (val) {
                                            addNewItemController
                                                .toggleEnableSubmitForReview();
                                          },
                                        ),
                                      ),
                                      7.pw,
                                      const Text(
                                        "to",
                                        style: CustomTextStyles
                                            .darkGreyTwoColor412,
                                      ),
                                      7.pw,
                                      Expanded(
                                        child: CustomTextField(
                                          textEditingController:
                                              addNewItemController
                                                  .priceRmToTextController,
                                          hintText: "0.00",
                                          keyboardType: TextInputType.number,
                                          borderRadius: 6,
                                          fillColor: CColors.scaffoldColor,
                                          onChangedFunction: (val) {
                                            addNewItemController
                                                .toggleEnableSubmitForReview();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.ph,
                                  const Text(
                                    "Inventory",
                                    style: CustomTextStyles.darkGreyTwoColor412,
                                  ),
                                  5.ph,
                                  CustomTextField(
                                    textEditingController: addNewItemController
                                        .priceRmTextController,
                                    hintText: "0",
                                    borderRadius: 6,
                                    keyboardType: TextInputType.number,
                                    fillColor: CColors.scaffoldColor,
                                    onChangedFunction: (val) {
                                      addNewItemController
                                          .toggleEnableSubmitForReview();
                                    },
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    10.ph,
                    TitleContainerWidget(
                      titleString: "Delivery",
                      radius: 0,
                      childWidget: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => const SetPickUpDeliveryScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: CColors.scaffoldColor,
                              ),
                              width: context.width,
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Choose",
                                        style: CustomTextStyles
                                            .darkGreyTwoColor412,
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
                      ),
                    ),
                    10.ph,
                    Obx(
                      () {
                        return addNewItemController.multipleVariations.value
                            ? CustomBackgroundContainer(
                                radius: 0,
                                topPadding: 15,
                                leftPadding: 10,
                                rightPadding: 10,
                                bottomPadding: 15,
                                width: context.width,
                                childWidget: Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Show Variation Price",
                                        style: CustomTextStyles
                                            .darkGreyTwoColor412,
                                      ),
                                    ),
                                    20.pw,
                                    AdvancedSwitch(
                                      activeColor: CColors.purpleAccentColor,
                                      inactiveColor: Colors.grey,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      width: 33,
                                      height: 18,
                                      onChanged: (val) {},
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    20.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 68,
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        decoration: const BoxDecoration(
          color: CColors.whiteColor,
          border: Border(
            top: BorderSide(
              color: CColors.lightGreyColor,
            ),
          ),
        ),
        child: Obx(
          () {
            return CustomElevatedButton(
              buttonText: "Submit for review",
              onPressedFunction: () {
                Get.back();
              },
              needShadow: false,
              backgroundColor:
                  addNewItemController.isSubmitForReviewEnabled.value
                      ? CColors.purpleAccentColor
                      : CColors.lightGreyColor,
              textStyle: addNewItemController.isSubmitForReviewEnabled.value
                  ? CustomTextStyles.white512
                  : CustomTextStyles.greyTwoColor414,
            );
          },
        ),
      ),
    );
  }
}
