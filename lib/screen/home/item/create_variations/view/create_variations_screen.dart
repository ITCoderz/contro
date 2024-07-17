import 'package:contro/reusable_widgets/custom_back_title.dart';
import 'package:contro/screen/home/item/create_variations/components/create_variations_components.dart';
import 'package:contro/screen/home/item/create_variations/controller/create_variations_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_outlined_button.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../set_price_and_inventory/view/set_price_and_inventory_screen.dart';

class CreateVariationsScreen extends StatelessWidget {
  const CreateVariationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final createVariationsController = Get.find<CreateVariationsController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
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
                    const CustomBackTitle(
                      title: "Create Variations",
                      hasCrossIcon: true,
                    ),
                    10.ph,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: CColors.whiteColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              right: 8,
                            ),
                            child: Container(
                              height: 160,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: CColors.whiteColor,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 8,
                                    color: CColors.greyTwoColor,
                                  ),
                                ],
                              ),
                            ),
                          ).alignWidget(
                            alignment: Alignment.center,
                          ),
                          SvgPicture.asset(
                            Assets.iconsVariationImage,
                          ).alignWidget(
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    GetBuilder<CreateVariationsController>(
                      init: CreateVariationsController(),
                      builder: (controller) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.noOfVariationsList.length,
                          separatorBuilder: (context, index) => 10.ph,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: VariationComponent(
                                    addOptionFunction: () {
                                      createVariationsController
                                          .addOptionAtIndex(index: index);
                                    },
                                    numberOfOptions: createVariationsController
                                        .options[index],
                                    galleryOptionFunction: () {},
                                    optionDeletedFunction: () {
                                      createVariationsController.removeOption(
                                          index: index);
                                    },
                                    removeVariations: () {
                                      createVariationsController
                                          .removeVariation(index: index);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
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
        child: Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                onPressedFunction: () {
                  createVariationsController.addVariation();
                },
                buttonText: "Add Variation",
              ),
            ),
            15.pw,
            Expanded(
              child: CustomElevatedButton(
                onPressedFunction: () {
                  Get.to(
                    () => const SetPriceAndInventoryScreen(),
                    transition: Transition.fadeIn,
                  );
                },
                buttonText: "Next",
                needShadow: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
