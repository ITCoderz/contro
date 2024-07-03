import 'package:contro/models/activity_model/activity_model.dart';
import 'package:contro/models/category_selection_model/category_selection_model.dart';
import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../controller/activity_detail_controller.dart';

class ActivityDetailScreen extends StatelessWidget {
  final ActivityModel activityModel;

  const ActivityDetailScreen({
    super.key,
    required this.activityModel,
  });

  @override
  Widget build(BuildContext context) {
    final activityDetailController = Get.find<ActivityDetailController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          height: context.height,
          width: context.width,
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
                    5.ph,
                    const CustomBackTitle(
                      title: "Activity Details.",
                    ),
                    10.ph,
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: CColors.whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    20.ph,
                    CategorySelectionTile(
                      onTapFunction: () {},
                      categorySelectionModel: CategorySelectionModel(
                        iconString: Assets.iconsContactBuyerIcon,
                        title: "Contact Buyer",
                      ),
                    ),
                    20.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 68,
        color: CColors.whiteColor,
        padding: const EdgeInsets.only(
          top: 10,
          left: 25,
          right: 25,
          bottom: 10,
        ),
        child: CustomElevatedButton(
          buttonText: "Print Packing List",
          onPressedFunction: () {},
          needShadow: false,
        ),
      ),
    );
  }
}
