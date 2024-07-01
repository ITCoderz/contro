import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/constants/constant_lists.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomAppBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CColors.whiteColor,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int index = 0;
              index < ConstantLists.bottomBarList.length;
              index++) ...[
            BottomNavBarComponent(
              selectedIndex: selectedIndex,
              bottomBarModel: ConstantLists.bottomBarList[index],
            ),
          ]
        ],
      ),
    );
  }
}

class BottomNavBarComponent extends StatelessWidget {
  final int selectedIndex;
  final BottomNavigationBarModel bottomBarModel;

  const BottomNavBarComponent({
    super.key,
    required this.selectedIndex,
    required this.bottomBarModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        12,
      ),
      onTap: selectedIndex == bottomBarModel.itemIndex
          ? null
          : bottomBarModel.onTapFunction,
      child: Ink(
        height: 45,
        width: 45,
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            selectedIndex == bottomBarModel.itemIndex
                ? bottomBarModel.selectedIconsString
                : bottomBarModel.unSelectedIconString,
            height: bottomBarModel.itemIndex == 2 ? 36 : 24,
            width: bottomBarModel.itemIndex == 2 ? 36 : 24,
          ),
        ),
      ),
    );
  }
}
