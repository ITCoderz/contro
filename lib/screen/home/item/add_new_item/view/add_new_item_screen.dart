import 'package:contro/reusable_widgets/custom_back_title.dart';
import 'package:contro/screen/home/item/add_new_item/controller/add_new_item_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_background_container.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../reusable_widgets/custom_text_fields/custom_text_field.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../create_new_business/components/create_new_business_components.dart';
import '../../create_variations/view/create_variations_screen.dart';

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
                    20.ph,
                    TitleContainerWidget(
                      titleString: "Account Number",
                      childWidget: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: CColors.borderOneColor),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.iconsGalleryIcon),
                            15.pw,
                            const Expanded(
                              child: Text(
                                "Upload 5 or more images/videos to get more exposure and sales opportunities.",
                                style: CustomTextStyles.greyTwoColor412,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    TitleContainerWidget(
                      titleString: "Category",
                      childWidget: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => const CreateVariationsScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              decoration: const BoxDecoration(
                                color: CColors.scaffoldColor,
                              ),
                              width: context.width,
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Products",
                                        style:
                                            CustomTextStyles.darkGreyColor412,
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
                    WhiteContainerTitleBackground(
                      titleString: "Instant App Name",
                      subtitleString:
                          "${addNewItemController.productNameTextController.text.length}/120",
                      childWidget: CustomTextField(
                        textEditingController:
                            addNewItemController.productNameTextController,
                        hintText: "Enter Instant App Name",
                        maxLength: 120,
                      ),
                    ),
                    10.ph,
                    TitleContainerWidget(
                      titleString: "SKU",
                      childWidget: CustomTextField(
                        textEditingController:
                            addNewItemController.skuTextController,
                        hintText: "Enter SKU",
                      ),
                    ),
                    10.ph,
                    WhiteContainerTitleBackground(
                      titleString: "Description",
                      subtitleString:
                          "${addNewItemController.descriptionTextController.text.length}/1000",
                      childWidget: CustomTextField(
                        textEditingController:
                            addNewItemController.descriptionTextController,
                        hintText:
                            "Enter Description. Try out our new AI tool to help you to bring your product to life.",
                        maxLength: 1000,
                        maxLines: null,
                        minLines: 1,
                        hintMaxLines: 2,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
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
        child: CustomElevatedButton(
          buttonText: "Submit for review",
          onPressedFunction: () {},
          needShadow: false,
          backgroundColor: CColors.lightGreyColor,
          textStyle: CustomTextStyles.greyTwoColor414,
        ),
      ),
    );
  }
}
