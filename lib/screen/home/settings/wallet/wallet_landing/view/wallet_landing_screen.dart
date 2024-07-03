import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../models/category_selection_model/category_selection_model.dart';
import '../../../../../../reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import '../../../../../../reusable_widgets/custom_back_title.dart';
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
                      decoration:
                          const BoxDecoration(color: CColors.greenAccentColor),
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
                            style: CustomTextStyles.white425,
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
                            itemCount:
                                ConstantLists.walletFilterModelList.length,
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
                            onTap: () {},
                            borderRadius: BorderRadius.circular(5),
                            child: SvgPicture.asset(Assets.iconsMenuIcon),
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: const BoxDecoration(
                        color: CColors.whiteColor,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                                  sellerFinanceModel:
                                      ConstantLists.sellerFinanceList[index],
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
      ),
    );
  }
}
