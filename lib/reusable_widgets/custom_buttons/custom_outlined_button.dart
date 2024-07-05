import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String buttonText;

  const CustomOutlinedButton({
    super.key,
    required this.onPressedFunction,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(220, 48),
        side: const BorderSide(
          color: CColors.purpleAccentColor,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        buttonText,
        style: CustomTextStyles.purpleAccentColor414,
      ),
    );
  }
}
