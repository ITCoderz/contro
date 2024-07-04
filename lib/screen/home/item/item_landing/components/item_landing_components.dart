import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../models/item_model/item_model.dart';

class ItemsLandingComponents extends StatelessWidget {
  final ItemModel itemModel;
  final Function(dynamic)? onChangedFunction;
  final Function()? optionOnPressed;
  final bool value;

  const ItemsLandingComponents({
    super.key,
    required this.itemModel,
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
          itemModel.imageAsset,
          height: 50,
          width: 50,
        ),
        10.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemModel.name,
                style: CustomTextStyles.darkGreyColor412,
              ),
              Text(
                itemModel.reference,
                style: CustomTextStyles.greyTwoColor412,
              ),
              const Text(
                "Packaging Products",
                style: CustomTextStyles.pinkAccentColor412,
              ),
              Text(
                "\$ ${itemModel.amount}",
                style: CustomTextStyles.darkGreyColor412,
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
        ),
      ],
    );
  }
}
