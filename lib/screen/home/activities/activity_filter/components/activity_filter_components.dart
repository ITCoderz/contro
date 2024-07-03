import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors/app_colors.dart';

class ActivityFilterComponent extends StatelessWidget {
  final String title;
  final int itemIndex, selectedIndex;
  final Function()? onTapFunction;

  const ActivityFilterComponent({
    super.key,
    required this.title,
    required this.itemIndex,
    required this.selectedIndex,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: itemIndex == selectedIndex
              ? CColors.purpleAccentColor.withOpacity(0.25)
              : CColors.borderOneColor,
          border: Border.all(
            color: itemIndex == selectedIndex
                ? CColors.purpleAccentColor
                : CColors.borderOneColor,
          ),
        ),
        child: FittedBox(
          child: Text(
            title,
            style: itemIndex == selectedIndex
                ? CustomTextStyles.purpleAccentColor614
                : CustomTextStyles.darkGreyColor414,
          ),
        ),
      ),
    );
  }
}