import 'package:contro/reusable_widgets/custom_text_fields/custom_text_field.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_outlined_button.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../set_pick_up_delivery/view/set_pick_up_delivery_screen.dart';
import '../controller/set_price_and_inventory_controller.dart';

class SetPriceAndInventoryScreen extends StatelessWidget {
  const SetPriceAndInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addNewItemController = Get.find<SetPriceAndInventoryController>();
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
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: CColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Option + Option",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(2),
                                child: SvgPicture.asset(
                                    Assets.iconsDeleteVariationIcon),
                              ),
                            ],
                          ),
                          10.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Price (RM)",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "0.00",
                                  keyboardType: TextInputType.number,
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Inventory",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "0",
                                  keyboardType: TextInputType.number,
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "SKU (Original)",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "Enter SKU",
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: CColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Option + Option",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(2),
                                child: SvgPicture.asset(
                                    Assets.iconsDeleteVariationIcon),
                              ),
                            ],
                          ),
                          10.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Price (RM)",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "0.00",
                                  keyboardType: TextInputType.number,
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Inventory",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "0",
                                  keyboardType: TextInputType.number,
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "SKU (Original)",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "Enter SKU",
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: CColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Option + Option",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(2),
                                child: SvgPicture.asset(
                                    Assets.iconsDeleteVariationIcon),
                              ),
                            ],
                          ),
                          10.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Price (RM)",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "0.00",
                                  keyboardType: TextInputType.number,
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Inventory",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "0",
                                  keyboardType: TextInputType.number,
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "SKU (Original)",
                                style: CustomTextStyles.darkGreyColor414,
                              ),
                              20.pw,
                              Expanded(
                                child: CustomTextField(
                                  borderColor: Colors.transparent,
                                  textAlign: TextAlign.end,
                                  textEditingController:
                                      TextEditingController(),
                                  hintText: "Enter SKU",
                                  horizontalPadding: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    30.ph,
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
        child: Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                onPressedFunction: () {},
                buttonText: "Bulk Edit",
              ),
            ),
            15.pw,
            Expanded(
              child: CustomElevatedButton(
                onPressedFunction: () {
                  Get.to(
                    () => const SetPickUpDeliveryScreen(),
                    transition: Transition.fadeIn,
                  );
                },
                buttonText: "Done",
                needShadow: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
