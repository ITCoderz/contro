import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/activities/activity_filter/components/activity_filter_components.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/constants/constant_lists.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../controller/activity_filter_controller.dart';

class ActivityFilterScreen extends StatelessWidget {
  const ActivityFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityFilterController = Get.find<ActivityFilterController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              5.ph,
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Filter.",
                    style: CustomTextStyles.darkGreyColor620,
                  ),
                ],
              ).alignWidget(
                alignment: Alignment.centerLeft,
              ),
              10.ph,
              Expanded(
                child: Container(
                  width: context.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: CColors.whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Activity Status",
                        style: CustomTextStyles.darkGreyColor414,
                      ),
                      10.ph,
                      Expanded(
                        child: AnimationLimiter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              mainAxisExtent: 48,
                            ),
                            itemCount:
                                ConstantLists.activitiesFilterListTwo.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => ActivityFilterComponent(
                                  title: ConstantLists
                                      .activitiesFilterListTwo[index]
                                      .filterName,
                                  itemIndex: ConstantLists
                                      .activitiesFilterListTwo[index].index,
                                  selectedIndex: activityFilterController
                                      .selectedIndex.value,
                                  onTapFunction: () {
                                    activityFilterController.toggleFilter(
                                        index: index);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.ph,
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressedFunction: () {
                        Get.back();
                      },
                      buttonText: "Cancel",
                      needShadow: false,
                      textStyle: CustomTextStyles.darkGreyColor414,
                      backgroundColor: CColors.borderOneColor,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
