import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
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
                        onTap: () {},
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
                        ? TableComponent(
                            paginationController: activityLandingController
                                .paginationActivityController,
                            dataList: ConstantLists.activityModelListTwo,
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
