import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../models/category_selection_model/category_selection_model.dart';
import '../../../../../../utils/colors/app_colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';

class ConnectToTile extends StatelessWidget {
  final Function()? onTapFunction;
  final CategorySelectionModel categorySelectionModel;
  final double borderRadius;

  const ConnectToTile({
    super.key,
    required this.onTapFunction,
    required this.categorySelectionModel,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapFunction,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          decoration: const BoxDecoration(
            color: CColors.whiteColor,
            border: Border(
              bottom: BorderSide(
                color: CColors.scaffoldColor,
              ),
            ),
          ),
          width: context.width,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  categorySelectionModel.iconString,
                  height: 18,
                  width: 18,
                ),
                15.pw,
                Expanded(
                  child: Text(
                    categorySelectionModel.title,
                    style: CustomTextStyles.darkGreyColor413,
                  ),
                ),
                20.pw,
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: CColors.darkGreyColor,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
