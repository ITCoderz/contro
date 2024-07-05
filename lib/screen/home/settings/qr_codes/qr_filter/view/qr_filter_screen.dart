import 'package:contro/screen/home/settings/qr_codes/qr_filter/controller/qr_filter_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/filter_button_component.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/constants/constant_lists.dart';
import '../../../../../../utils/text_styles/text_styles.dart';

class QrFilterScreen extends StatelessWidget {
  const QrFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qrFilterController = Get.find<QrFilterController>();
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "QR Status",
                          style: CustomTextStyles.darkGreyColor414,
                        ),
                        10.ph,
                        AnimationLimiter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              mainAxisExtent: 48,
                            ),
                            itemCount:
                                ConstantLists.activitiesFilterListThree.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => FilterButtonComponent(
                                  title: ConstantLists
                                      .activitiesFilterListThree[index]
                                      .filterName,
                                  itemIndex: ConstantLists
                                      .activitiesFilterListThree[index].index,
                                  selectedIndex:
                                      qrFilterController.selectedQrIndex.value,
                                  onTapFunction: () {
                                    qrFilterController.toggleFilter(
                                        index: index);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        10.ph,
                        const Text(
                          "Sorted by",
                          style: CustomTextStyles.darkGreyColor414,
                        ),
                        10.ph,
                        AnimationLimiter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              mainAxisExtent: 48,
                            ),
                            itemCount:
                                ConstantLists.activitiesFilterListFour.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => FilterButtonComponent(
                                  title: ConstantLists
                                      .activitiesFilterListFour[index]
                                      .filterName,
                                  itemIndex: ConstantLists
                                      .activitiesFilterListFour[index].index,
                                  selectedIndex: qrFilterController
                                      .selectedSortedByIndex.value,
                                  onTapFunction: () {
                                    qrFilterController.toggleSortedByFilter(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
