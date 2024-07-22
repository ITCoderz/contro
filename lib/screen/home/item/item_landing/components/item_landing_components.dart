import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../../models/item_model/item_model.dart';

class ItemsLandingComponents extends StatelessWidget {
  final ItemModel itemModel;
  final Function(dynamic)? onChangedFunction;
  final Function()? optionOnPressed;
  final bool value;
  final int valueKey;
  final Function(BuildContext)? shareFunction, editFunction, deleteFunction;

  const ItemsLandingComponents({
    super.key,
    required this.itemModel,
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
    return Container(
      decoration: const BoxDecoration(
        color: CColors.whiteColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.pw,
          Image.asset(
            itemModel.imageAsset,
            height: 50,
            width: 50,
          ),
          Expanded(
            child: Slidable(
              key: ValueKey(valueKey),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.92,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
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
                            style: CustomTextStyles.orangeAccentColor412,
                          ),
                          Text(
                            "\$ ${itemModel.amount}",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 50,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AdvancedSwitch(
                          initialValue: value,
                          activeColor: CColors.purpleAccentColor,
                          inactiveColor: Colors.grey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
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
            ),
          ),
        ],
      ),
    );
  }
}
