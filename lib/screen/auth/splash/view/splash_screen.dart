import 'package:contro/screen/auth/splash/controller/splash_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/colors/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: CColors.splashGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Obx(
              () {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  top: splashController.animatedToggled.value
                      ? (context.height / 2) - ((context.width * 0.7) / 2)
                      : 0,
                  child: Container(
                    width: context.width * 1,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      Assets.iconsControSplash,
                      width: context.width * 0.6,
                    ),
                  ),
                );
              },
            ),
            Obx(() {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: splashController.opacityToggled.value ? 1 : 0,
                    child: SvgPicture.asset(
                      Assets.iconsControSplashTwoIcon,
                      height: 20,
                    ),
                  ),
                  20.ph,
                ],
              ).alignWidget(
                alignment: Alignment.bottomCenter,
              );
            }),
          ],
        ),
      ),
    );
  }
}
