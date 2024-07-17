import 'package:contro/models/activity_model/activity_model.dart';
import 'package:contro/models/category_selection_model/category_selection_model.dart';
import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/reusable_widgets/custom_timeline.dart';
import 'package:contro/screen/home/chat/chat_landing/view/chat_landing_screen.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/custom_back_title.dart';
import '../../../../../reusable_widgets/custom_buttons/custom_elevated_button.dart';
import '../../../../../reusable_widgets/custom_dialogs/feedback_dialog.dart';
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
              10.ph,
              const CustomBackTitle(
                title: "Activity Details.",
              ),
              10.ph,
              Container(
                width: context.width,
                decoration: const BoxDecoration(
                  color: CColors.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Order ID: #${activityModel.orderId}",
                                  style: CustomTextStyles.darkGreyTwoColor412,
                                ),
                              ),
                              10.pw,
                              Text(
                                activityModel.created!,
                                style: CustomTextStyles.blueThreeColor412,
                              ),
                            ],
                          ),
                          10.ph,
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
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Mailer Box",
                                            style: CustomTextStyles
                                                .darkGreyTwoColor414,
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
                                                  ? CColors.orangeColor
                                                  : activityModel.status ==
                                                          "In Transit"
                                                      ? CColors.blueSecondColor
                                                      : activityModel.status ==
                                                              "Completed"
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
                                      style:
                                          CustomTextStyles.darkGreyTwoColor412,
                                    ),
                                    const Text(
                                      "350 x 350 x 120, T180/T180, BF",
                                      style:
                                          CustomTextStyles.darkGreyTwoColor412,
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
                                            color: CColors.scaffoldColor,
                                          ),
                                          child: const Text(
                                            "x 100",
                                            style: CustomTextStyles
                                                .darkGreyColor412,
                                          ),
                                        ),
                                        const Text(
                                          "RM 3.00",
                                          style: CustomTextStyles
                                              .darkGreyTwoColor414,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: CColors.scaffoldColor,
                    ),
                    5.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "100 item(s)",
                            style: CustomTextStyles.lightGreyTwoColor412,
                          ),
                          10.pw,
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Order Total: ",
                                    style: CustomTextStyles.darkGreyTwoColor510,
                                  ),
                                  TextSpan(
                                    text: "RM 339.90",
                                    style: CustomTextStyles.darkGreyTwoColor514,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    5.ph,
                    const Divider(
                      color: CColors.scaffoldColor,
                    ),
                    5.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: CustomTextStyles.darkGreyTwoColor412,
                              ),
                              Text(
                                "RM 300.00",
                                style: CustomTextStyles.lightGreyTwoColor412,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping fees",
                                style: CustomTextStyles.darkGreyTwoColor412,
                              ),
                              Text(
                                "RM 30.00",
                                style: CustomTextStyles.lightGreyTwoColor412,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment gateway (3%)",
                                style: CustomTextStyles.darkGreyTwoColor412,
                              ),
                              Text(
                                "RM 9.90",
                                style: CustomTextStyles.lightGreyTwoColor412,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Promo/Discount",
                                style: CustomTextStyles.pinkAccentColor412,
                              ),
                              Text(
                                "- RM 12.90",
                                style: CustomTextStyles.redAccentColor412,
                              ),
                            ],
                          ),
                          4.ph,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Total",
                                style: CustomTextStyles.darkGreyTwoColor512,
                              ),
                              Text(
                                "RM 339.90",
                                style: CustomTextStyles.darkGreyTwoColor614,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    5.ph,
                    const Divider(
                      color: CColors.scaffoldColor,
                    ),
                    5.ph,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order time",
                                style: CustomTextStyles.darkGreyTwoColor412,
                              ),
                              Text(
                                "03/02/2024, 02:23 PM",
                                style: CustomTextStyles.greyTwoColor412,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment time",
                                style: CustomTextStyles.darkGreyTwoColor412,
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
          buttonText: activityModel.status == "Dispute"
              ? "View Dispute"
              : activityModel.activityStatus == "An order is confirmed."
                  ? "Add Payment Receipt"
                  : activityModel.activityStatus ==
                          "Payment has been completed."
                      ? "Print Packing List"
                      : activityModel.activityStatus ==
                              "The order is being processed now."
                          ? "Print Shipping Label"
                          : activityModel.activityStatus ==
                                  "The order is on its way."
                              ? "Check Status"
                              : activityModel.activityStatus ==
                                      "The order has been delivered."
                                  ? "Check Status"
                                  : activityModel.activityStatus ==
                                          "Order is complete."
                                      ? "Leave a Review"
                                      : "",
          onPressedFunction: () {
            if (activityModel.activityStatus == "Order is complete.") {
              showDialog(
                context: context,
                builder: (context) => FeedbackDialog(
                  onDissatisfiedFunction: () {
                    Get.back();
                  },
                  onNeutralFunction: () {
                    Get.back();
                  },
                  onSatisfiedFunction: () {
                    Get.back();
                  },
                ),
              );
            }
          },
          needShadow: false,
          backgroundColor: activityModel.status == "Dispute"
              ? CColors.redAccentTwoColor
              : null,
        ),
      ),
    );
  }
}
