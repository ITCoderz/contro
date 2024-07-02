import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/bank_account_model/bank_account_model.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';

class BankAccountComponents extends StatelessWidget {
  final BankAccountModel bankAccountModel;
  final Function()? onTapFunction;

  const BankAccountComponents({
    super.key,
    required this.onTapFunction,
    required this.bankAccountModel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapFunction,
          child: Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: const BoxDecoration(
              color: CColors.whiteColor,
            ),
            width: context.width,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    bankAccountModel.assetImage,
                    width: 33,
                  ),
                  10.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bankAccountModel.bankName,
                          style: CustomTextStyles.darkGreyColor414,
                        ),
                        Text(
                          bankAccountModel.accountNumber,
                          style: CustomTextStyles.darkGreyColor412,
                        ),
                      ],
                    ),
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
