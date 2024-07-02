import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/screen/home/settings/theme/controller/theme_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themController = Get.find<ThemeController>();
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
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              title: "Themes.",
                            ),
                            20.ph,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: context.width,
                                height: 500,
                                decoration: BoxDecoration(
                                  color: CColors.whiteColor,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 8,
                                      color: CColors.greyTwoColor,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(Assets.imagesThemeBackground)
                                        .alignWidget(
                                      alignment: Alignment.topCenter,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        right: 15,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: CColors.darkGreyColor
                                              .withOpacity(0.45),
                                        ),
                                        child: const Text(
                                          "Selected",
                                          style:
                                              CustomTextStyles.darkGreyColor412,
                                        ),
                                      ),
                                    ).alignWidget(
                                      alignment: Alignment.topRight,
                                    ),
                                    Container(
                                      height: 330,
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                        bottom: 12,
                                      ),
                                      width: context.width,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Assets.imagesThemeWhiteBackground,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          65.ph,
                                          const Text(
                                            "Extrabread\nDigital Print Box",
                                            style: CustomTextStyles
                                                .darkGreyColor616,
                                          ),
                                          1.ph,
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Super Mailer Box",
                                                style: CustomTextStyles
                                                    .pinkAccentColor412,
                                              ),
                                              Text(
                                                "RM 0.00",
                                                style: CustomTextStyles
                                                    .greyTwoColor516,
                                              ),
                                            ],
                                          ),
                                          5.ph,
                                          const Text(
                                            "Description",
                                            style: CustomTextStyles
                                                .greyTwoColor410,
                                          ),
                                          2.ph,
                                          const Text(
                                            "The description text goes here and to make it looks good, please write description for around 300 words. the text goes on and we not sure what do write but we keep writing and fgo on and go on and go on.",
                                            style: CustomTextStyles
                                                .darkGreyColor411,
                                          ),
                                          10.ph,
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 36,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: CColors.greyThreeColor,
                                                ),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  padding: EdgeInsets.zero,
                                                  icon: SvgPicture.asset(
                                                    Assets.iconsCartIcon,
                                                    height: 20,
                                                  ),
                                                ),
                                              ),
                                              10.pw,
                                              Expanded(
                                                child: CustomElevatedButton(
                                                  onPressedFunction: () {},
                                                  buttonText: "Buy Now",
                                                  width: context.width,
                                                  height: 36,
                                                  needShadow: false,
                                                  backgroundColor:
                                                      CColors.pinkAccentColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ).alignWidget(
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            20.ph,
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Default Theme",
                                    style: CustomTextStyles.darkGreyColor514,
                                  ),
                                  TextSpan(
                                    text: " by Contro.",
                                    style: CustomTextStyles.greyTwoColor412,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
