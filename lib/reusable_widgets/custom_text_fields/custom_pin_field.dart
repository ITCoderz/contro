import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomPinField extends StatelessWidget {
  final TextEditingController pinController;
  final String? Function(String?)? validatorFunction;

  const CustomPinField({
    super.key,
    required this.pinController,
    required this.validatorFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      keyboardType: TextInputType.number,
      length: 6,
      showCursor: true,
      defaultPinTheme: PinTheme(
        textStyle: CustomTextStyles.mainBlack514,
        decoration: BoxDecoration(
          color: CColors.whiteColor,
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
        height: 52,
        width: 48,
      ),
      focusedPinTheme: PinTheme(
        textStyle: CustomTextStyles.mainBlack514,
        decoration: BoxDecoration(
          color: CColors.whiteColor,
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
        height: 52,
        width: 48,
      ),
      closeKeyboardWhenCompleted: true,
      errorBuilder: (
        validatorMessage,
        inputNumbers,
      ) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.ph,
            Text(
              validatorMessage!,
              style: CustomTextStyles.red412,
            ).alignWidget(
              alignment: Alignment.center,
            ),
          ],
        );
      },
      errorPinTheme: PinTheme(
        textStyle: CustomTextStyles.mainBlack514,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        height: 52,
        width: 48,
      ),
      validator: validatorFunction,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      hapticFeedbackType: HapticFeedbackType.mediumImpact,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
