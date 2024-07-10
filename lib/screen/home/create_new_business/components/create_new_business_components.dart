import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/colors/app_colors.dart';

class WhiteContainerTitleBackground extends StatelessWidget {
  final String titleString;
  final String? subtitleString;

  final Widget childWidget;

  const WhiteContainerTitleBackground({
    super.key,
    required this.titleString,
    this.subtitleString,
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
              subtitleString != null
                  ? Text(
                      subtitleString!,
                      style: CustomTextStyles.greyTwoColor412,
                    )
                  : const SizedBox.shrink()
            ],
          ),
          10.ph,
          childWidget
        ],
      ),
    );
  }
}

class SelectionTileComponent extends StatelessWidget {
  final bool isSelected;
  final String title, descriptionTextOne;
  final Function()? onTapFunction;
  final String imageAsset;

  const SelectionTileComponent({
    super.key,
    required this.isSelected,
    required this.title,
    required this.descriptionTextOne,
    required this.onTapFunction,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapFunction,
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            decoration: BoxDecoration(
              color: CColors.whiteColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isSelected
                    ? CColors.purpleAccentColor
                    : CColors.borderOneColor,
                width: isSelected ? 1.5 : 0.5,
              ),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 155,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(imageAsset),
                  5.ph,
                  Text(
                    title,
                    style: CustomTextStyles.darkGreyTwoColor412,
                  ),
                  5.ph,
                  Text(
                    descriptionTextOne,
                    style: CustomTextStyles.darkGreyTwoColor410,
                    textAlign: TextAlign.center,
                  ),
                  8.ph,
                  Container(
                    height: 16,
                    width: 16,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? CColors.purpleAccentColor
                          : CColors.whiteColor,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? null
                          : Border.all(color: CColors.greyColor),
                    ),
                    child: isSelected
                        ? Container(
                            height: 8,
                            width: 8,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CColors.whiteColor,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
