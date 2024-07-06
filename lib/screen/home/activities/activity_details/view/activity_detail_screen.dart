import 'package:contro/models/activity_model/activity_model.dart';
import 'package:contro/models/category_selection_model/category_selection_model.dart';
import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/reusable_widgets/custom_timeline.dart';
import 'package:contro/screen/home/chat/chat_landing/view/chat_landing_screen.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
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
          child: Column(
            
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
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Assets.imagesActivityItemImage,
                            height: 50,
                          ),
                          10.pw,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mailer Box",
                                            style: CustomTextStyles
                                                .darkGreyColor414,
                                          ),
                                          Text(
                                            "MB-203998A",
                                            style: CustomTextStyles
                                                .greyTwoColor412,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: activityModel.status ==
                                                  "Open"
                                              ? CColors.yellowAccentColor
                                              : activityModel.status ==
                                                      "In Transit"
                                                  ? CColors.blueSecondColor
                                                  : activityModel.status ==
                                                          "Complete"
                                                      ? CColors
                                                          .greenAccentTwoColor
                                                      : CColors
                                                          .redAccentColor),
                                      child: Text(
                                        activityModel.status!,
                                        style: CustomTextStyles.white412,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Remarks",
                                  style: CustomTextStyles.darkGreyColor412,
                                ),
                                const Text(
                                  "350 x 350 x 120, T180/T180, BF",
                                  style: CustomTextStyles.blueThreeColor412,
                                ),
                                2.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: CColors.greyTwoColor
                                            .withOpacity(0.25),
                                      ),
                                      child: const Text(
                                        "x 100",
                                        style: CustomTextStyles
                                            .darkGreyColor412,
                                      ),
                                    ),
                                    const Text(
                                      "RM 3.00",
                                      style:
                                          CustomTextStyles.darkGreyColor414,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      5.ph,
                      const Divider(
                        color: CColors.scaffoldColor,
                      ),
                      5.ph,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          Text(
                            "RM 300.00",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping fees",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          Text(
                            "RM 30.00",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          Text(
                            "RM 9.90",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                        ],
                      ),
                      4.ph,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Total",
                            style: CustomTextStyles.darkGreyColor512,
                          ),
                          Text(
                            "RM 339.90",
                            style: CustomTextStyles.darkGreyColor614,
                          ),
                        ],
                      ),
                      5.ph,
                      const Divider(
                        color: CColors.scaffoldColor,
                      ),
                      5.ph,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order No",
                            style: CustomTextStyles.darkGreyColor512,
                          ),
                          Text(
                            "#102938",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                        ],
                      ),
                      5.ph,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order time",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          Text(
                            "03/02/2024, 02:23 PM",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment time",
                            style: CustomTextStyles.darkGreyColor412,
                          ),
                          Text(
                            "03/02/2024, 02:23 PM",
                            style: CustomTextStyles.greyTwoColor412,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                10.ph,
                CategorySelectionTile(
                  onTapFunction: () {
                    Get.to(
                          () => const ChatLandingScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  categorySelectionModel: CategorySelectionModel(
                    iconString: Assets.iconsContactBuyerIcon,
                    title: "Contact Buyer",
                  ),
                ),
                10.ph,
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: context.width,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: CColors.whiteColor,
                      ),
                      child: TimeLineComponent(
                        activityModel: activityModel,
                      ),
                    ),
                  ),
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
          left: 25,
          right: 25,
          bottom: 10,
        ),
        child: CustomElevatedButton(
          buttonText: activityModel.activityStatus ==
                      "An order is confirmed." ||
                  activityModel.activityStatus == "Preparing order."
              ? "Print Packing List"
              : activityModel.activityStatus == "Order is ready for delivery."
                  ? "Print Shipping Label"
                  : activityModel.activityStatus == "Order is out for delivery."
                      ? "Track Order"
                      : activityModel.activityStatus == "Order is delivered."
                          ? "Marked as Complete"
                          : activityModel.activityStatus == "Order is complete."
                              ? "Leave a Review"
                              : "",
          onPressedFunction: () {
            if (activityModel.activityStatus == "An order is confirmed." ||
                activityModel.activityStatus == "Preparing order.") {
            } else if (activityModel.activityStatus ==
                "Order is ready for delivery.") {
            } else if (activityModel.activityStatus ==
                "Order is out for delivery.") {
            } else if (activityModel.activityStatus == "Order is delivered.") {
            } else if (activityModel.activityStatus == "Order is complete.") {}
          },
          needShadow: false,
        ),
      ),
    );
  }
}
