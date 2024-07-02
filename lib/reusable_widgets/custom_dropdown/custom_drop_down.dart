import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomDropDown extends StatelessWidget {
  final Function(String?)? onChanged;
  final String? Function(String?)? validatorFunction;
  final List<String> mappingList;
  final String hintText;
  final TextStyle style;
  final double? height, width;
  final String? value;

  const CustomDropDown({
    super.key,
    this.height,
    this.width,
    this.validatorFunction,
    this.style = CustomTextStyles.darkGreyColor412,
    this.value,
    required this.onChanged,
    required this.hintText,
    required this.mappingList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownButtonFormField2(
        value: value,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: CColors.scaffoldColor,
          hintText: hintText,
          hintStyle: style,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CColors.borderOneColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                2,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CColors.borderOneColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CColors.borderOneColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CColors.redColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                2,
              ),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CColors.redColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                2,
              ),
            ),
          ),
        ),
        isExpanded: true,
        items: mappingList
            .asMap()
            .map((index, item) => MapEntry(
                  index,
                  DropdownMenuItem<String>(
                    value: item,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(child: Text(item, style: style)),
                  ),
                ))
            .values
            .toList(),
        isDense: true,
        menuItemStyleData: const MenuItemStyleData(
          overlayColor: WidgetStatePropertyAll(CColors.darkGreyColor),
        ),
        validator: validatorFunction,
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(height: 60),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: CColors.darkGreyColor,
          ),
          iconSize: 14,
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: CColors.scaffoldColor),
        ),
      ),
    );
  }
}
