import 'package:contro/reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import 'package:contro/screen/home/dashboard/components/dashboard_components.dart';
import 'package:contro/screen/home/dashboard/controller/dashboard_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/constants/constant_lists.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../reusable_widgets/custom_background_container.dart';
import '../../../../reusable_widgets/table_component.dart';
import '../../../../utils/colors/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashBoardController = Get.find<DashboardController>();
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
                    20.ph,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.iconsNewUserDashboardLogo,
                          width: 24,
                          height: 24,
                        ),
                        10.pw,
                        const Text(
                          "~WesleyBread",
                          style: CustomTextStyles.darkGreyColor520,
                        ),
                      ],
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    20.ph,
                    CustomBackgroundContainer(
                      radius: 8,
                      childWidget: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SummaryComponent(
                              overviewModel: ConstantLists.summaryModelList[0],
                            ),
                            5.pw,
                            const VerticalDivider(
                              color: CColors.borderOneColor,
                              thickness: 0.5,
                              width: 5,
                            ),
                            Expanded(
                              child: SummaryComponent(
                                overviewModel:
                                    ConstantLists.summaryModelList[1],
                              ),
                            ),
                            const VerticalDivider(
                              color: CColors.borderOneColor,
                              thickness: 0.5,
                              width: 5,
                            ),
                            5.pw,
                            SummaryComponent(
                              overviewModel: ConstantLists.summaryModelList[2],
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      width: context.width,
                      radius: 8,
                      childWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sales Statistics",
                            style: CustomTextStyles.darkGreyColor414,
                          ),
                          10.ph,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "\$468",
                                style: CustomTextStyles.darkGreyColor630,
                              ),
                              10.pw,
                              CustomBackgroundContainer(
                                bottomPadding: 3,
                                leftPadding: 5,
                                topPadding: 3,
                                rightPadding: 5,
                                radius: 4,
                                alignment: Alignment.center,
                                backgroundColor:
                                    CColors.lightGreenColor.withOpacity(0.3),
                                childWidget: const Text(
                                  "+ 4.2%",
                                  style: CustomTextStyles.darkGreenColor411,
                                ),
                              ),
                            ],
                          ),
                          5.ph,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Overview",
                                    style: CustomTextStyles.darkGreyColor512,
                                  ),
                                  10.ph,
                                  const OverviewComponent(
                                    progressValue: 0.65,
                                    title: "Daily Sales",
                                    value: "\$1200.45",
                                  ),
                                  10.ph,
                                  const OverviewComponent(
                                    progressValue: 0.65,
                                    title: "Daily Orders",
                                    value: "14",
                                  ),
                                ],
                              ),
                              Expanded(
                                child: CustomDailyRevenueChart(
                                  data: ConstantLists.revenueData,
                                  tooltip: dashBoardController.tooltip,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    const Text(
                      "Activity.",
                      style: CustomTextStyles.darkGreyColor518,
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    10.ph,
                    SizedBox(
                      height: 340,
                      child: TableComponent(
                        paginationController:
                            dashBoardController.paginationActivityController,
                        dataList: ConstantLists.activityModelList,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 0,
      ),
    );
  }
}
