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
  final double? horizontalPadding, verticalPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final int? maxLength;

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
    this.horizontalPadding,
    this.verticalPadding,
    this.inputFormatters,
    this.textAlign,
    this.maxLength,
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
        style: CustomTextStyles.darkGreyColor412,
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
          fillColor: CColors.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 10,
            vertical: verticalPadding ?? 10,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CColors.borderOneColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CColors.borderOneColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: CColors.borderOneColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CColors.redColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(
                2,
              ),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CColors.redColor, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(
                2,
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
