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

import '../../../../reusable_widgets/custom_background_container.dart';
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
                    const Text(
                      "Hello, WesleyBread.",
                      style: CustomTextStyles.darkGreyColor518,
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      width: context.width,
                      radius: 8,
                      childWidget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Overview",
                            style: CustomTextStyles.darkGreyTwoColor513,
                          ).alignWidget(
                            alignment: Alignment.centerLeft,
                          ),
                          10.ph,
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2,
                              mainAxisExtent: 80,
                            ),
                            itemCount:
                                ConstantLists.dashboardOverviewList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SlideAnimation(
                                verticalOffset: 30.0,
                                child: FadeInAnimation(
                                  child: DashboardOverviewComponent(
                                    dashboardOverviewModel: ConstantLists
                                        .dashboardOverviewList[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
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
                            style: CustomTextStyles.darkGreyTwoColor513,
                          ),
                          10.ph,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "\$468",
                                style: CustomTextStyles.darkGreyColor625,
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
                                  15.ph,
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
                    10.ph,
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        mainAxisExtent: 80,
                      ),
                      itemCount: ConstantLists.revenueList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SlideAnimation(
                          verticalOffset: 30.0,
                          child: FadeInAnimation(
                            child: RevenueTiles(
                              dashboardOverviewModel:
                                  ConstantLists.revenueList[index],
                            ),
                          ),
                        );
                      },
                    ),
                    10.ph,
                    CustomBackgroundContainer(
                      width: context.width,
                      radius: 8,
                      childWidget: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Overview",
                                style: CustomTextStyles.darkGreyTwoColor513,
                              ),
                              InkWell(
                                onTap: () {
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
                                        child: SizedBox(
                                          height: context.height,
                                          width: context.width,
                                          child: SingleChildScrollView(
                                            child: AnimationLimiter(
                                              child: Column(
                                                children: AnimationConfiguration
                                                    .toStaggeredList(
                                                  duration: const Duration(
                                                      milliseconds: 375),
                                                  childAnimationBuilder:
                                                      (widget) =>
                                                          SlideAnimation(
                                                    horizontalOffset: 50.0,
                                                    child: FadeInAnimation(
                                                      child: widget,
                                                    ),
                                                  ),
                                                  children: [
                                                    20.ph,
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
                                                          "Show Analytics",
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
                                                          .analyticFilter
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
                                                            verticalOffset:
                                                                50.0,
                                                            child:
                                                                FadeInAnimation(
                                                              child:
                                                                  AnalyticsFilterTile(
                                                                onTapFunction:
                                                                    () {
                                                                  dashBoardController
                                                                      .changeFilter(
                                                                          value:
                                                                              ConstantLists.analyticFilter[index]);
                                                                },
                                                                value: ConstantLists
                                                                        .analyticFilter[
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
                                borderRadius: BorderRadius.circular(3),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(() {
                                        return Text(
                                          dashBoardController
                                              .analyticFilter.value,
                                          style: CustomTextStyles
                                              .darkGreyTwoColor511,
                                        );
                                      }),
                                      3.ph,
                                      const Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: CColors.darkGreyTwoColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          10.ph,
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 3,
                              mainAxisExtent: 160,
                            ),
                            itemCount: ConstantLists.analyticsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SlideAnimation(
                                verticalOffset: 30.0,
                                child: FadeInAnimation(
                                  child: AnalyticTile(
                                    analyticModel:
                                        ConstantLists.analyticsList[index],
                                  ),
                                ),
                              );
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
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 0,
      ),
    );
  }
}
