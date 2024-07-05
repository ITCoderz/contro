import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';
import '../../../../../models/pick_up_location_model/pick_up_location_model.dart';
import '../../../../../utils/colors/app_colors.dart';

class AddLocationComponent extends StatelessWidget {
  final Function()? onTapFunction;
  final PickUpLocationModel pickUpLocationModel;

  const AddLocationComponent({
    super.key,
    required this.onTapFunction,
    required this.pickUpLocationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pickUpLocationModel.title,
                style: CustomTextStyles.darkGreyColor412,
              ),
              2.ph,
              Text(
                pickUpLocationModel.description,
                style: CustomTextStyles.greyTwoColor412,
              ),
            ],
          ),
        ),
        20.pw,
        InkWell(
          onTap: onTapFunction,
          borderRadius: BorderRadius.circular(20),
          child: SvgPicture.asset(
            Assets.iconsMessagesCirclePlus,
          ),
        ),
      ],
    );
  }
}

class CustomTabComponent extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function()? onTapFunction;

  const CustomTabComponent({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapFunction,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? CColors.borderOneColor : Colors.transparent,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: isSelected
                  ? CustomTextStyles.darkGreyColor514
                  : CustomTextStyles.darkGreyColor414,
            ),
          ),
        ),
      ),
    );
  }
}
