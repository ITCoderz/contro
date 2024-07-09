import 'package:contro/reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import 'package:contro/screen/home/settings/qr_codes/create_qr_code/view/create_qr_code_screen.dart';
import 'package:contro/screen/home/settings/qr_codes/qr_codes_landing/components/qr_codes_landing_components.dart';
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
import '../../qr_filter/view/qr_filter_options.dart';
import '../../qr_filter/view/qr_filter_screen.dart';
import '../controller/qr_codes_landing_controller.dart';

class QrCodesLandingScreen extends StatelessWidget {
  const QrCodesLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qrCodeLandingController = Get.find<QrCodesLandingController>();
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
                    "QR Codes.",
                    style: CustomTextStyles.darkGreyColor622,
                  ),
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
                                          qrCodeLandingController.toggleFilter(
                                              index: index);
                                        },
                                        walletFiltersModel: ConstantLists
                                            .qrCodesFilterList[index],
                                        selectedIndex: qrCodeLandingController
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
                          Get.to(
                            () => const QrFilterScreen(),
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
                  return qrCodeLandingController.isRefreshed.value
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
                              itemCount: ConstantLists.qrCodeModelList.length,
                              physics: const NeverScrollableScrollPhysics(),
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
                                      child: QrCodesLandingComponents(
                                        qrCodesModel: ConstantLists
                                            .qrCodeModelList[index],
                                        onChangedFunction: (val) {},
                                        value: false,
                                        optionOnPressed: () {
                                          Get.to(
                                            () => const QrFilterOptionsScreen(),
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
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "No QR Code yet.",
                                    style: CustomTextStyles.darkGreyColor516,
                                  ),
                                  2.ph,
                                  const Text(
                                    "Create your first QR Code now.",
                                    style: CustomTextStyles.greyTwoColor413,
                                  ),
                                  15.ph,
                                  CustomElevatedButton(
                                    onPressedFunction: () {
                                      qrCodeLandingController.toggleRefreshed();
                                    },
                                    buttonText: "Refresh",
                                    needShadow: false,
                                    width: 210,
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
      bottomNavigationBar: Obx(
        () {
          return qrCodeLandingController.isRefreshed.value
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
                    buttonText: "Create QR Code",
                    onPressedFunction: () {
                      Get.to(
                        () => const CreateQrCodeScreen(),
                        transition: Transition.fadeIn,
                      );
                    },
                    needShadow: false,
                  ),
                )
              : const CustomBottomAppBar(selectedIndex: 4);
        },
      ),
    );
  }
}
