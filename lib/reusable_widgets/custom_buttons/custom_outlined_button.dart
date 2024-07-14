import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String buttonText;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? width, height;

  const CustomOutlinedButton({
    super.key,
    required this.onPressedFunction,
    required this.buttonText,
    this.textStyle,
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          width ?? 220,
          height ?? 48,
        ),
        padding: EdgeInsets.zero,
        side: BorderSide(
          color: borderColor ?? CColors.purpleAccentColor,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        buttonText,
        style: textStyle ?? CustomTextStyles.purpleAccentColor414,
      ),
    );
  }
}
