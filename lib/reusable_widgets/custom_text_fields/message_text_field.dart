import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/assets.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class MessageTextField extends StatelessWidget {
  final Function(String)? onChangedFunction;
  final Function()? onTap;
  final TextEditingController textEditingController;
  final String? hintText;
  final double? width, height;
  final bool isEnabled, readOnly;

  final TextInputType? keyboardType;
  final int? minLines, maxLines;
  final double? horizontalPadding, verticalPadding, suffixMinWidth;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final int? maxLength;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double? borderRadius;

  const MessageTextField({
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
    this.horizontalPadding,
    this.fillColor,
    this.verticalPadding,
    this.suffixMinWidth,
    this.inputFormatters,
    this.textAlign,
    this.maxLength,
    this.textStyle,
    this.borderRadius,
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
        style: textStyle ?? CustomTextStyles.darkGreyColor414,
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
          hintStyle: CustomTextStyles.darkGreyColor414,
          enabled: true,
          filled: true,
          prefixIcon: SvgPicture.asset(
            Assets.iconsSearchIcon,
          ),
          prefixIconConstraints: BoxConstraints(
            maxWidth: suffixMinWidth ?? 40,
            minWidth: suffixMinWidth ?? 40,
          ),
          fillColor: fillColor ?? CColors.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 10,
            vertical: verticalPadding ?? 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 6),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 6,
              ),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 6,
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
