import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../models/seller_finance_model/seller_finance_model.dart';

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
