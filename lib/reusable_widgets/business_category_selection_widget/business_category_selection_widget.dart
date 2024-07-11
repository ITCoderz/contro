import 'package:contro/screen/home/create_new_business/controller/create_new_business_controller.dart';
import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../models/category_selection_model/category_selection_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/constants/constant_lists.dart';

class BusinessCategorySelectionWidget extends StatelessWidget {
  const BusinessCategorySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
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
                    20.ph,
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
                          "Category.",
                          style: CustomTextStyles.darkGreyColor620,
                        ),
                      ],
                    ).alignWidget(
                      alignment: Alignment.centerLeft,
                    ),
                    10.ph,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ConstantLists.categorySelectionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: CategorySelectionTile(
                                onTapFunction: () {
                                  Get.find<CreateNewBusinessController>()
                                      .addBusinessCategory(ConstantLists
                                          .categorySelectionList[index].title);
                                },
                                categorySelectionModel:
                                    ConstantLists.categorySelectionList[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategorySelectionTile extends StatelessWidget {
  final Function()? onTapFunction;
  final CategorySelectionModel categorySelectionModel;
  final double borderRadius;

  const CategorySelectionTile({
    super.key,
    required this.onTapFunction,
    required this.categorySelectionModel,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
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
                  SvgPicture.asset(
                    categorySelectionModel.iconString,
                    height: 18,
                    width: 18,
                  ),
                  15.pw,
                  Expanded(
                    child: Text(
                      categorySelectionModel.title,
                      style: CustomTextStyles.darkGreyColor414,
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
      ),
    );
  }
}
