import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../models/bank_account_model/bank_account_model.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';

class BankAccountComponents extends StatelessWidget {
  final BankAccountModel bankAccountModel;
  final Function()? onTapFunction;
  final int valueKey;
  final Function(BuildContext)? editFunction, deleteFunction;

  const BankAccountComponents({
    super.key,
    required this.onTapFunction,
    required this.bankAccountModel,
    required this.valueKey,
    required this.editFunction,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CColors.blueSecondColor,
          ),
        ),
        Slidable(
          key: ValueKey(valueKey),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTapFunction,
                child: Ink(
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: CColors.blueSecondColor,
                  ),
                  width: context.width,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              bankAccountModel.assetImage,
                              width: 30,
                            ),
                            10.pw,
                            Expanded(
                              child: Text(
                                bankAccountModel.bankName,
                                style: CustomTextStyles.white413,
                              ),
                            ),
                          ],
                        ),
                        10.ph,
                        Text(
                          bankAccountModel.accountNumber,
                          style: CustomTextStyles.white420,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
