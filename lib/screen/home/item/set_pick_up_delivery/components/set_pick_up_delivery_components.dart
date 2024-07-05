import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/assets.dart';
import '../../../../../utils/colors/app_colors.dart';

class SetPickUpDeliveryComponents extends StatelessWidget {
  final String assetIcon, title;
  final bool status;
  final Function(dynamic)? onChangedFunction;

  const SetPickUpDeliveryComponents({
    super.key,
    required this.assetIcon,
    required this.title,
    required this.status,
    required this.onChangedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(assetIcon),
          10.pw,
          Expanded(
            child: Text(
              title,
              style: CustomTextStyles.darkGreyColor414,
            ),
          ),
          10.pw,
          AdvancedSwitch(
            initialValue: status,
            activeColor: CColors.purpleAccentColor,
            inactiveColor: Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            width: 36,
            height: 20,
            onChanged: onChangedFunction,
          ),
        ],
      ),
    );
  }
}

class PickUpLocationWidget extends StatelessWidget {
  final bool isEditing;
  final String title, description;
  final Function()? removeFunction;

  const PickUpLocationWidget({
    super.key,
    required this.isEditing,
    required this.title,
    required this.description,
    required this.removeFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isEditing
            ? Container(
                height: 22,
                width: 22,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: CColors.redAccentTwoColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: removeFunction,
                  padding: EdgeInsets.zero,
                  icon: Container(
                    height: 1.5,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: CColors.whiteColor,
                    ),
                  ),
                ),
              )
            : SvgPicture.asset(
                Assets.iconsMapPinConnect,
              ),
        15.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyles.darkGreyColor412,
              ),
              Text(
                description,
                style: CustomTextStyles.greyTwoColor412,
              ),
            ],
          ),
        )
      ],
    );
  }
}
