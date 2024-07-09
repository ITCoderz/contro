import 'package:contro/reusable_widgets/custom_buttons/custom_outlined_button.dart';
import 'package:contro/screen/home/activities/activity_landing/controller/activity_landing_controller.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/filter_option_container.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/constants/constant_lists.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../add_new_item/view/add_new_item_screen.dart';
import '../../item_filters/view/item_category_screen.dart';
import '../../item_filters/view/item_filters_screen.dart';
import '../../item_filters/view/item_options_screen.dart';
import '../components/item_landing_components.dart';

class ItemLandingScreen extends StatelessWidget {
  const ItemLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityLandingController = Get.find<ActivityLandingController>();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 17,
                    ),
                  ),
                  const Text(
                    "Item.",
                    style: CustomTextStyles.darkGreyColor622,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    child: SvgPicture.asset(Assets.iconsActivitySearchIcon),
                  ),
                ],
              ),
              20.ph,
              SizedBox(
                height: 28,
                child: AnimationLimiter(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: ConstantLists.qrCodesFilterList.length,
                          separatorBuilder: (context, index) => 5.pw,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Obx(
                                    () {
                                      return FilterOptionContainer(
                                        onTapFunction: () {
                                          activityLandingController
                                              .toggleFilter(index: index);
                                        },
                                        walletFiltersModel: ConstantLists
                                            .qrCodesFilterList[index],
                                        selectedIndex: activityLandingController
                                            .selectedIndex.value,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      10.pw,
                      InkWell(
                        onTap: () {
                          // Get.to(
                          //   () => const ItemCategoryScreen(),
                          //   transition: Transition.downToUp,
                          // );
                          Get.to(
                            () => const ItemFilterScreen(),
                            transition: Transition.downToUp,
                          );
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: SvgPicture.asset(Assets.iconsMenuIcon),
                      ),
                    ],
                  ),
                ),
              ),
              20.ph,
              Obx(
                () {
                  return activityLandingController.isRefreshed.value
                      ? Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                              color: CColors.whiteColor,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: ConstantLists.itemModelList.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: CColors.borderOneColor,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: ItemsLandingComponents(
                                        itemModel:
                                            ConstantLists.itemModelList[index],
                                        onChangedFunction: (val) {},
                                        value: false,
                                        optionOnPressed: () {
                                          Get.to(
                                            () => const ItemOptionsScreen(),
                                            transition: Transition.downToUp,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "No Item yet.",
                                  style: CustomTextStyles.darkGreyColor516,
                                ),
                                2.ph,
                                const Text(
                                  "Try adding your first product or service.",
                                  style: CustomTextStyles.greyTwoColor413,
                                ),
                                15.ph,
                                CustomElevatedButton(
                                  onPressedFunction: () {
                                    Get.to(
                                      () => const AddNewItemScreen(),
                                      transition: Transition.fadeIn,
                                    );
                                  },
                                  buttonText: "Add New Item",
                                  needShadow: false,
                                  width: 220,
                                ),
                                5.ph,
                                CustomOutlinedButton(
                                  onPressedFunction: () {
                                    activityLandingController.toggleRefreshed();
                                  },
                                  buttonText: "Import Items",
                                ),
                                if (context.isPortrait) 120.ph,
                              ],
                            ),
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return activityLandingController.isRefreshed.value
              ? Container(
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
                    buttonText: "Add Item",
                    onPressedFunction: () {
                      Get.to(
                        () => const AddNewItemScreen(),
                        transition: Transition.fadeIn,
                      );
                    },
                    needShadow: false,
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
