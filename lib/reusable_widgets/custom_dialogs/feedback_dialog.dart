import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class FeedbackDialog extends StatelessWidget {
  final Function()? onDissatisfiedFunction;
  final Function()? onNeutralFunction;
  final Function()? onSatisfiedFunction;

  const FeedbackDialog({
    super.key,
    required this.onDissatisfiedFunction,
    required this.onNeutralFunction,
    required this.onSatisfiedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      content: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: CColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 8,
              color: CColors.greyTwoColor,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 28,
              width: 28,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CColors.scaffoldColor,
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.close_rounded,
                  color: CColors.darkGreyTwoColor,
                  size: 18,
                ),
              ),
            ).alignWidget(
              alignment: Alignment.centerLeft,
            ),
            30.ph,
            SvgPicture.asset(
              Assets.iconsReviewDialogIcon,
            ),
            20.ph,
            const Text(
              "How are you feeling?",
              style: CustomTextStyles.darkGreyTwoColor618,
            ),
            10.ph,
            const Text(
              "Your input is valuable to us.",
              style: CustomTextStyles.purpleAccentColor412,
            ),
            30.ph,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onDissatisfiedFunction,
                  child: SvgPicture.asset(
                    Assets.iconsDisatifactionIcon,
                    height: 45,
                  ),
                ),
                15.pw,
                InkWell(
                  onTap: onNeutralFunction,
                  child: SvgPicture.asset(
                    Assets.iconsModerateIcon,
                    height: 45,
                  ),
                ),
                15.pw,
                InkWell(
                  onTap: onSatisfiedFunction,
                  child: SvgPicture.asset(
                    Assets.iconsHappyIcon,
                    height: 45,
                  ),
                ),
              ],
            ),
            60.ph,
          ],
        ),
      ),
    );
  }
}
