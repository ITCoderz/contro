import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String buttonText;
  final double? height, width, radius;
  final bool isProcessing;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool needShadow;

  const CustomElevatedButton({
    super.key,
    required this.onPressedFunction,
    required this.buttonText,
    this.width,
    this.textStyle,
    this.backgroundColor,
    this.height,
    this.radius,
    this.needShadow = true,
    this.isProcessing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: needShadow
            ? [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.15),
                ),
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.30),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: isProcessing ? null : onPressedFunction,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          fixedSize: Size(
            width ?? context.width,
            height ?? 48,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          backgroundColor: backgroundColor ?? CColors.purpleAccentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 6),
          ),
        ),
        child: isProcessing
            ? const Padding(
                padding: EdgeInsets.all(5),
                child: CircularProgressIndicator(color: CColors.whiteColor),
              )
            : FittedBox(
                child: Text(
                  buttonText,
                  style: textStyle ?? CustomTextStyles.white512,
                ),
              ),
      ),
    );
  }
}
