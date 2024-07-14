import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';
import '../custom_buttons/custom_elevated_button.dart';

class WithdrawalSuccessDialog extends StatelessWidget {
  final Function()? onPressedFunction;

  const WithdrawalSuccessDialog({
    super.key,
    required this.onPressedFunction,
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
              Assets.iconsSuccessDialogIcon,
            ),
            20.ph,
            const Text(
              "Withdrawal Successful.",
              style: CustomTextStyles.darkGreyTwoColor618,
            ),
            10.ph,
            const Text(
              "Receipt has been sent to",
              style: CustomTextStyles.mildGreenColor410,
            ),
            10.ph,
            const Text(
              "wesley@contro.me",
              style: CustomTextStyles.purpleAccentColor512,
            ),
            30.ph,
            CustomElevatedButton(
              needShadow: false,
              onPressedFunction: onPressedFunction,
              buttonText: "Confirm",
              backgroundColor: CColors.mildGreenColor,
              textStyle: CustomTextStyles.white414,
            ),
            60.ph,
          ],
        ),
      ),
    );
  }
}
