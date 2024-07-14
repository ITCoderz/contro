import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../models/category_selection_model/category_selection_model.dart';
import '../../../../../../reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import '../../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../../reusable_widgets/filter_button_component.dart';
import '../../../../../../reusable_widgets/filter_option_container.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/constants/constant_lists.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../withdrawal/view/withdrawal_screen.dart';
import '../components/wallet_landing_components.dart';
import '../controller/wallet_landing_controller.dart';

class WalletLandingScreen extends StatelessWidget {
  const WalletLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletLandingController = Get.find<WalletLandingController>();
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
              const CustomBackTitle(
                title: "Wallet.",
              ),
              20.ph,
              Container(
                width: context.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(color: CColors.mildGreenColor),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Account Balance",
                      style: CustomTextStyles.white414,
                    ),
                    5.ph,
                    const Text(
                      "RM 1,888,000.00",
                      style: CustomTextStyles.white422,
                    ),
                    15.ph,
                    const Text(
                      "Last Updated 24th June 2024",
                      style: CustomTextStyles.white410,
                    ),
                  ],
                ),
              ),
              10.ph,
              CategorySelectionTile(
                onTapFunction: () {},
                categorySelectionModel: CategorySelectionModel(
                  iconString: Assets.iconsInfoCircle,
                  title: "Request Money",
                ),
              ),
              CategorySelectionTile(
                onTapFunction: () {
                  Get.to(
                    () => const WithdrawalScreen(),
                    transition: Transition.fadeIn,
                  );
                },
                categorySelectionModel: CategorySelectionModel(
                  iconString: Assets.iconsCash,
                  title: "Withdrawal",
                ),
              ),
              20.ph,
              SizedBox(
                height: 28,
                child: Row(
                  children: [
                    Expanded(
                        child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: ConstantLists.walletFilterModelList.length,
                      separatorBuilder: (context, index) => 5.pw,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Obx(() {
                                return FilterOptionContainer(
                                  onTapFunction: () {
                                    walletLandingController.toggleFilter(
                                        index: index);
                                  },
                                  walletFiltersModel: ConstantLists
                                      .walletFilterModelList[index],
                                  selectedIndex: walletLandingController
                                      .selectedIndex.value,
                                );
                              }),
                            ),
                          ),
                        );
                      },
                    )),
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
                                        "Filter.",
                                        style:
                                            CustomTextStyles.darkGreyColor620,
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
                                          "Transaction Type",
                                          style:
                                              CustomTextStyles.darkGreyColor414,
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
                                                .filterListFour.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Obx(
                                                () => FilterButtonComponent(
                                                  title: ConstantLists
                                                      .filterListFour[index]
                                                      .filterName,
                                                  itemIndex: ConstantLists
                                                      .filterListFour[index]
                                                      .index,
                                                  selectedIndex:
                                                      walletLandingController
                                                          .selectedTransactionTypeIndex
                                                          .value,
                                                  onTapFunction: () {
                                                    walletLandingController
                                                        .toggleTransactionType(
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
                                          style:
                                              CustomTextStyles.darkGreyColor414,
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
                                            itemBuilder: (BuildContext context,
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
                                                      walletLandingController
                                                          .selectedSortedByIndex
                                                          .value,
                                                  onTapFunction: () {
                                                    walletLandingController
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
                                          textStyle:
                                              CustomTextStyles.darkGreyColor414,
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
              20.ph,
              Expanded(
                child: SingleChildScrollView(
                  child: AnimationLimiter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: const BoxDecoration(
                              color: CColors.whiteColor,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: ConstantLists.sellerFinanceList.length,
                              separatorBuilder: (context, index) => 15.ph,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: TransactionTile(
                                        sellerFinanceModel: ConstantLists
                                            .sellerFinanceList[index],
                                      ),
                                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
