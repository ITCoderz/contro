import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../item_landing/controller/item_landing_controller.dart';

class ItemCategoryScreen extends StatelessWidget {
  const ItemCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemLandingController = Get.find<ItemLandingController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      color: CColors.greyTwoColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              5.ph,
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: CColors.darkGreyColor,
                    ),
                  ),
                  5.pw,
                  const Text(
                    "Filter.",
                    style: CustomTextStyles.darkGreyColor620,
                  ),
                ],
              ).alignWidget(
                alignment: Alignment.centerLeft,
              ),
              15.ph,
              ItemCategorySelectionTile(
                onTapFunction: () {},
                imageAsset: Assets.iconsProductIcon,
                title: "Products",
                description: "(Tangible Goods, Digital Products, etc...)",
              ),
              10.ph,
              ItemCategorySelectionTile(
                onTapFunction: () {},
                imageAsset: Assets.iconsServiceIcon,
                title: "Services",
                description: "(Bookings, Cleaning, etc...) ",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 68,
        color: CColors.whiteColor,
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: CustomElevatedButton(
          onPressedFunction: () {
            Get.back();
          },
          buttonText: "Cancel",
          needShadow: false,
          textStyle: CustomTextStyles.white414,
          backgroundColor: CColors.darkGreyColor,
        ),
      ),
    );
  }
}

class ItemCategorySelectionTile extends StatelessWidget {
  final Function()? onTapFunction;
  final String imageAsset;
  final String title;
  final String description;

  const ItemCategorySelectionTile({
    super.key,
    required this.onTapFunction,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapFunction,
          child: Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: const BoxDecoration(
              color: CColors.whiteColor,
            ),
            width: context.width,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    imageAsset,
                    height: 18,
                    width: 18,
                  ),
                  15.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: CustomTextStyles.darkGreyColor414,
                        ),
                        2.ph,
                        Text(
                          description,
                          style: CustomTextStyles.greyTwoColor412,
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
