import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChangedFunction;
  final Function()? onTap;
  final TextEditingController textEditingController;
  final String? hintText;
  final double? width, height;
  final bool isEnabled, readOnly;

  final TextInputType? keyboardType;
  final int? minLines, maxLines;
  final double? horizontalPadding,
      verticalPadding,
      suffixMinWidth,
      borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final int? maxLength;
  final bool needSuffix;
  final Widget? suffixWidget;
  final Color? fillColor, borderColor;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.hintText = "",
    this.onChangedFunction,
    this.onTap,
    this.keyboardType,
    this.minLines,
    this.maxLines = 1,
    this.isEnabled = true,
    this.readOnly = false,
    this.needSuffix = false,
    this.horizontalPadding,
    this.fillColor,
    this.borderColor,
    this.verticalPadding,
    this.suffixMinWidth,
    this.borderRadius,
    this.inputFormatters,
    this.suffixWidget,
    this.textAlign,
    this.maxLength,
    this.textStyle,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        style: textStyle ?? CustomTextStyles.darkGreyColor412,
        textAlign: textAlign ?? TextAlign.start,
        cursorColor: CColors.mainBlack,
        keyboardType: keyboardType ?? TextInputType.text,
        minLines: minLines,
        maxLines: maxLines,
        enabled: isEnabled,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: CustomTextStyles.greyTwoColor412,
          enabled: true,
          filled: true,
          suffixIcon:
              needSuffix ? suffixWidget ?? const SizedBox.shrink() : null,
          suffixIconConstraints: BoxConstraints(
            maxWidth: suffixMinWidth ?? 40,
            minWidth: suffixMinWidth ?? 40,
          ),
          fillColor: fillColor ?? CColors.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 10,
            vertical: verticalPadding ?? 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.borderOneColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.borderOneColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 2),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.borderOneColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 2),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CColors.redColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 2,
              ),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CColors.redColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 2,
              ),
            ),
          ),
          counterStyle: const TextStyle(
            fontSize: 0,
          ),
        ),
        onChanged: onChangedFunction,
        onTap: onTap,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      ),
    );
  }
}
