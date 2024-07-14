import 'package:contro/models/qr_codes_model/qr_code_model.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../utils/colors/app_colors.dart';

class QrCodesLandingComponents extends StatelessWidget {
  final QrCodesModel qrCodesModel;
  final Function(dynamic)? onChangedFunction;
  final Function()? optionOnPressed;
  final bool value;
  final int valueKey;
  final Function(BuildContext)? shareFunction, editFunction, deleteFunction;

  const QrCodesLandingComponents({
    super.key,
    required this.qrCodesModel,
    required this.onChangedFunction,
    required this.value,
    required this.optionOnPressed,
    required this.valueKey,
    required this.shareFunction,
    required this.editFunction,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(valueKey),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.8,
        children: [
          CustomSlidableAction(
            onPressed: editFunction,
            backgroundColor: CColors.orangeColor,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.iconsShareSlidableIcon,
                  height: 14,
                  width: 14,
                ),
                5.pw,
                const Text(
                  "Share",
                  style: CustomTextStyles.white412,
                ),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: editFunction,
            backgroundColor: CColors.blueTwoColor,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.iconsEditSlidableIcon,
                  height: 14,
                  width: 14,
                ),
                5.pw,
                const Text(
                  "Edit",
                  style: CustomTextStyles.white412,
                ),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: deleteFunction,
            backgroundColor: CColors.redAccentColor,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.iconsDeleteSlidableIcon,
                  height: 14,
                  width: 14,
                ),
                5.pw,
                const Text(
                  "Delete",
                  style: CustomTextStyles.white412,
                ),
              ],
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            qrCodesModel.qrCodeImage,
            height: 50,
            width: 50,
          ).alignWidget(
            alignment: Alignment.topCenter,
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
          Padding(
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
