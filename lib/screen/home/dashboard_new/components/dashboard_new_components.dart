import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../models/dashboard_overview_model/dashboard_overview_model.dart';
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
        horizontal: 10,
        vertical: 10,
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
            style: CustomTextStyles.darkGreyColor513,
          ),
          10.ph,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
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
                        style: CustomTextStyles.darkGreyColor413,
                      ),
                      Text(
                        subTitleTwo,
                        style: CustomTextStyles.greyTwoColor412,
                      ),
                      5.ph,
                      CustomElevatedButton(
                        onPressedFunction: onPressedFunction,
                        buttonText: "Get Started",
                        width: 255,
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


