import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';
import '../utils/text_styles/text_styles.dart';

class CustomBackgroundContainer extends StatelessWidget {
  final Color? backgroundColor;
  final double? radius,
      height,
      width,
      leftPadding,
      rightPadding,
      topPadding,
      bottomPadding;
  final Widget? childWidget;
  final AlignmentGeometry? alignment;

  const CustomBackgroundContainer({
    super.key,
    this.backgroundColor,
    this.radius,
    this.height,
    this.width,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.childWidget,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: EdgeInsets.only(
        left: leftPadding ?? 20,
        right: rightPadding ?? 20,
        top: topPadding ?? 20,
        bottom: bottomPadding ?? 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? CColors.whiteColor,
        borderRadius: BorderRadius.circular(radius ?? 5),
      ),
      child: childWidget,
    );
  }
}

class TitleContainerWidget extends StatelessWidget {
  final String titleString;
  final Widget? subtitleWidget;

  final Widget childWidget;

  const TitleContainerWidget({
    super.key,
    required this.titleString,
    this.subtitleWidget,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: CColors.whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleString,
                style: CustomTextStyles.darkGreyColor414,
              ),
              subtitleWidget ?? const SizedBox.shrink()
            ],
          ),
          10.ph,
          childWidget
        ],
      ),
    );
  }
}
