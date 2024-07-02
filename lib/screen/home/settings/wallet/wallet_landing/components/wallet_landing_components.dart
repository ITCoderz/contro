import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../models/seller_finance_model/seller_finanace_model.dart';
import '../../../../../../models/wallet_filters_model/wallet_filters_model.dart';
import '../../../../../../utils/colors/app_colors.dart';

class TransactionTile extends StatelessWidget {
  final SellerFinanceModel sellerFinanceModel;

  const TransactionTile({
    super.key,
    required this.sellerFinanceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          sellerFinanceModel.isRevenue
              ? Assets.iconsArrowDownLeftCircle
              : Assets.iconsArrowUpRightCircle,
          height: 30,
          width: 30,
        ),
        10.pw,
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #${sellerFinanceModel.financeId}",
                      style: CustomTextStyles.darkGreyColor612,
                    ),
                    Text(
                      sellerFinanceModel.date,
                      style: CustomTextStyles.blueThreeColor412,
                    ),
                    Text(
                      sellerFinanceModel.service,
                      style: CustomTextStyles.greyTwoColor412,
                    ),
                  ],
                ),
              ),
              10.pw,
              Text(
                "\$ ${sellerFinanceModel.amount}",
                style: sellerFinanceModel.isRevenue
                    ? CustomTextStyles.greenAccentColor414
                    : CustomTextStyles.redAccentColor414,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TransactionFilterWidget extends StatelessWidget {
  final WalletFiltersModel walletFiltersModel;
  final int selectedIndex;
  final Function()? onTapFunction;
  const TransactionFilterWidget({
    super.key,
    required this.walletFiltersModel,
    required this.selectedIndex,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: walletFiltersModel.index == selectedIndex
                ? CColors.purpleAccentColor.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          walletFiltersModel.filterName,
          style: walletFiltersModel.index == selectedIndex
              ? CustomTextStyles.purpleAccentColor412
              : CustomTextStyles.greyTwoColor412,
        ),
      ),
    );
  }
}
