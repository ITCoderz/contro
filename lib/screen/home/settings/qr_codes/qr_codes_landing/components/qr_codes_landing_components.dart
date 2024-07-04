import 'package:contro/models/qr_codes_model/qr_code_model.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import '../../../../../../utils/colors/app_colors.dart';

class QrCodesLandingComponents extends StatelessWidget {
  final QrCodesModel qrCodesModel;
  final Function(dynamic)? onChangedFunction;
  final Function()? optionOnPressed;
  final bool value;
  const QrCodesLandingComponents({
    super.key,
    required this.qrCodesModel,
    required this.onChangedFunction,
    required this.value,
    required this.optionOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          qrCodesModel.qrCodeImage,
          height: 50,
          width: 50,
        ),
        10.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                qrCodesModel.title,
                style: CustomTextStyles.darkGreyColor412,
              ),
              Text(
                "Created on\n${qrCodesModel.createOn}",
                style: CustomTextStyles.blueThreeColor412,
              ),
              Text(
                "${qrCodesModel.views} views",
                style: CustomTextStyles.pinkAccentColor412,
              ),
            ],
          ),
        ),
        10.pw,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AdvancedSwitch(
                  initialValue: value,
                  activeColor: CColors.purpleAccentColor,
                  inactiveColor: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  width: 30,
                  height: 16,
                  onChanged: onChangedFunction,
                ),
                5.pw,
                const Text(
                  "Active",
                  style: CustomTextStyles.darkGreyColor412,
                ),
              ],
            ),
            15.ph,
            Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CColors.scaffoldColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                onPressed: optionOnPressed,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: CColors.darkGreyColor,
                  size: 13,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
