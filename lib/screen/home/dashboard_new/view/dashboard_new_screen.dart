import 'package:contro/reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../components/dashboard_new_components.dart';

class DashboardNewScreen extends StatelessWidget {
  const DashboardNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
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
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CColors.secondaryBlackColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Welcome to Contro Instant App.",
                            style: CustomTextStyles.white414,
                          ),
                          10.ph,
                          const Text(
                            "Explore your creativity to build instant app for your business.Grow your business with Contro Instant App.",
                            style: CustomTextStyles.white412,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: CColors.whiteColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "0/2 Complete",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                          2.ph,
                          const Text(
                            "2 steps to setup your instant app!",
                            style: CustomTextStyles.darkGreyColor514,
                          ),
                          2.ph,
                          const Text(
                            "Check off these to dos to kick-start your business on Contro Instant App.",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    GetStartedComponent(
                      iconString: Assets.iconsProductTwoIcon,
                      title: "Do you have a product or service to sell?",
                      subTitleOne: "Add your first product or service.",
                      subTitleTwo:
                          "Start building your inventory by adding your first product or service.",
                      onPressedFunction: () {
                        Get.off(
                          () => const DashboardScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
                    ),
                    20.ph,
                    GetStartedComponent(
                      iconString: Assets.iconsMovieIcon,
                      title: "Create awesome instant app for your business.",
                      subTitleOne: "Create your first instant page.",
                      subTitleTwo:
                          "Start adding some vibrant and appealing applications to your instant app.",
                      onPressedFunction: () {
                        Get.off(
                          () => const DashboardScreen(),
                          transition: Transition.fadeIn,
                        );
                      },
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
