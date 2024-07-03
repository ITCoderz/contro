import 'package:flutter/material.dart';

import '../models/wallet_filters_model/wallet_filters_model.dart';
import '../utils/colors/app_colors.dart';
import '../utils/text_styles/text_styles.dart';

class FilterOptionContainer extends StatelessWidget {
  final WalletFiltersModel walletFiltersModel;
  final int selectedIndex;
  final Function()? onTapFunction;

  const FilterOptionContainer({
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
