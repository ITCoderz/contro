import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/activities/activity_landing/component/activity_landing_components.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import '../../../../../reusable_widgets/filter_button_component.dart';
import '../../../../../reusable_widgets/filter_option_container.dart';
import '../../../../../reusable_widgets/table_component.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/constants/constant_lists.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../activity_filter/view/activity_filter_screen.dart';
import '../controller/activity_landing_controller.dart';

class ActivityLandingScreen extends StatelessWidget {
  const ActivityLandingScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Activity.",
                    style: CustomTextStyles.darkGreyColor622,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => const ActivityFilterScreen(),
                        transition: Transition.downToUp,
                      );
                    },
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
                          itemCount: ConstantLists.activitiesFilterList.length,
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
                                            .activitiesFilterList[index],
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
                                    top: 20, left: 20, right: 20, bottom: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
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
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    5.ph,
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
                                          "Activity Status",
                                          style:
                                              CustomTextStyles.darkGreyColor618,
                                        ),
                                      ],
                                    ).alignWidget(
                                      alignment: Alignment.centerLeft,
                                    ),
                                    10.ph,
                                    Container(
                                      width: context.width,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: CColors.whiteColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Activity Status",
                                            style: CustomTextStyles
                                                .darkGreyColor414,
                                          ),
                                          10.ph,
                                          AnimationLimiter(
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                crossAxisCount: 3,
                                                mainAxisExtent: 40,
                                              ),
                                              itemCount: ConstantLists
                                                  .filterListSeven.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Obx(
                                                  () => FilterButtonComponent(
                                                    title: ConstantLists
                                                        .filterListSeven[index]
                                                        .filterName,
                                                    itemIndex: ConstantLists
                                                        .filterListSeven[index]
                                                        .index,
                                                    selectedIndex:
                                                        activityLandingController
                                                            .selectedActivityStatusIndex
                                                            .value,
                                                    onTapFunction: () {
                                                      activityLandingController
                                                          .toggleActivityStatusType(
                                                        index: index,
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          10.ph,
                                          const Text(
                                            "Sorted by",
                                            style: CustomTextStyles
                                                .darkGreyColor414,
                                          ),
                                          10.ph,
                                          AnimationLimiter(
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                crossAxisCount: 3,
                                                mainAxisExtent: 40,
                                              ),
                                              itemCount: ConstantLists
                                                  .filterListFive.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Obx(
                                                  () => FilterButtonComponent(
                                                    title: ConstantLists
                                                        .filterListFive[index]
                                                        .filterName,
                                                    itemIndex: ConstantLists
                                                        .filterListFive[index]
                                                        .index,
                                                    selectedIndex:
                                                        activityLandingController
                                                            .selectedSortedByIndex
                                                            .value,
                                                    onTapFunction: () {
                                                      activityLandingController
                                                          .toggleSortedByFilter(
                                                              index: index);
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    30.ph,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomElevatedButton(
                                            onPressedFunction: () {
                                              Get.back();
                                            },
                                            buttonText: "Cancel",
                                            needShadow: false,
                                            textStyle: CustomTextStyles
                                                .darkGreyColor414,
                                            backgroundColor:
                                                CColors.borderOneColor,
                                          ),
                                        ),
                                        15.pw,
                                        Expanded(
                                          child: CustomElevatedButton(
                                            onPressedFunction: () {
                                              Get.back();
                                            },
                                            buttonText: "Confirm",
                                            needShadow: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
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
                  return Expanded(
                    child: activityLandingController.isRefreshed.value
                        ? AnimationLimiter(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount:
                                  ConstantLists.activityModelListTwo.length,
                              separatorBuilder: (context, index) => 10.ph,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: ActivityComponent(
                                        activityModel: ConstantLists
                                            .activityModelListTwo[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "No activity yet.",
                                    style: CustomTextStyles.darkGreyColor516,
                                  ),
                                  2.ph,
                                  const Text(
                                    "Looking forward to your first order.",
                                    style: CustomTextStyles.greyTwoColor413,
                                  ),
                                  15.ph,
                                  CustomElevatedButton(
                                    onPressedFunction: () {
                                      activityLandingController
                                          .toggleRefreshed();
                                    },
                                    buttonText: "Refresh",
                                    needShadow: false,
                                    width: 210,
                                    backgroundColor: CColors.darkGreyColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 3,
      ),
    );
  }
}
