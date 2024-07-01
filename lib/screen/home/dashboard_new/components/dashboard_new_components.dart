import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';

class GetStartedComponent extends StatelessWidget {
  final String iconString, title, subTitleOne, subTitleTwo;
  final Function()? onPressedFunction;

  const GetStartedComponent({
    super.key,
    required this.iconString,
    required this.title,
    required this.subTitleOne,
    required this.subTitleTwo,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: CColors.whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyles.darkGreyColor514,
          ),
          10.ph,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 0.5,
                color: CColors.borderOneColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  iconString,
                ),
                10.pw,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subTitleOne,
                        style: CustomTextStyles.darkGreyColor414,
                      ),
                      5.ph,
                      Text(
                        subTitleTwo,
                        style: CustomTextStyles.greyTwoColor412,
                      ),
                      5.ph,
                      CustomElevatedButton(
                        onPressedFunction: onPressedFunction,
                        buttonText: "Get Started",
                        width: context.width,
                        height: 36,
                        needShadow: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}