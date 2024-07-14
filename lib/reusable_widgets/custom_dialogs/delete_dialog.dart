import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';
import '../custom_buttons/custom_elevated_button.dart';
import '../custom_buttons/custom_outlined_button.dart';

class DeleteDialog extends StatelessWidget {
  final Function()? onPressedFunction;
  final bool isForDeleteChat;
  const DeleteDialog({
    super.key,
    required this.onPressedFunction,
    this.isForDeleteChat = false,
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
              Assets.iconsDeleteDialogIcon,
            ),
            20.ph,
            Text(
              isForDeleteChat ? "Delete the Chat?" : "Delete the Bank Account?",
              style: CustomTextStyles.darkGreyTwoColor618,
            ),
            const Text(
              "You will not be able to recover it.",
              style: CustomTextStyles.redAccentColor410,
            ),
            30.ph,
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressedFunction: () {
                      Get.back();
                    },
                    borderColor: CColors.redAccentColor,
                    buttonText: "Cancel",
                    textStyle: CustomTextStyles.redAccentColor414,
                  ),
                ),
                10.pw,
                Expanded(
                  child: CustomElevatedButton(
                    needShadow: false,
                    onPressedFunction: onPressedFunction,
                    buttonText: "Yes Delete it.",
                    backgroundColor: CColors.redAccentColor,
                    textStyle: CustomTextStyles.white414,
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
