import 'package:contro/reusable_widgets/custom_buttons/custom_elevated_button.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/colors/app_colors.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class VerifyDialog extends StatelessWidget {
  final Function()? confirmFunction;

  const VerifyDialog({
    super.key,
    required this.confirmFunction,
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
              Assets.iconsVerifyItsYouIcon,
            ),
            20.ph,
            const Text(
              "Verify It’s You !",
              style: CustomTextStyles.darkGreyTwoColor620,
            ),
            10.ph,
            const Text(
              "Verification code has been emailed to",
              style: CustomTextStyles.darkGreyTwoColor410,
            ),
            10.ph,
            const Text(
              "wesley@contro.me",
              style: CustomTextStyles.blueThreeColor512,
            ),
            30.ph,
            CustomElevatedButton(
              needShadow: false,
              onPressedFunction: confirmFunction,
              buttonText: "Confirm",
              backgroundColor: CColors.blueThreeColor,
              textStyle: CustomTextStyles.white414,
            ),
            60.ph,
          ],
        ),
      ),
    );
  }
}
