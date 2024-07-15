import 'package:contro/screen/home/activities/activity_details/view/activity_detail_screen.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../../models/activity_model/activity_model.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class ActivityComponent extends StatelessWidget {
  final ActivityModel activityModel;

  const ActivityComponent({
    super.key,
    required this.activityModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(
            () => ActivityDetailScreen(
              activityModel: activityModel,
            ),
            transition: Transition.fadeIn,
          );
        },
        child: Ink(
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "Mailer Box",
                                      style:
                                          CustomTextStyles.darkGreyTwoColor414,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: activityModel.status == "Open"
                                            ? CColors.orangeColor
                                            : activityModel.status ==
                                                    "In Transit"
                                                ? CColors.blueSecondColor
                                                : activityModel.status ==
                                                        "Completed"
                                                    ? CColors
                                                        .greenAccentTwoColor
                                                    : CColors.redAccentColor),
                                    child: Text(
                                      activityModel.status!,
                                      style: CustomTextStyles.white412,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Remarks",
                                style: CustomTextStyles.darkGreyTwoColor412,
                              ),
                              const Text(
                                "350 x 350 x 120, T180/T180, BF",
                                style: CustomTextStyles.darkGreyTwoColor412,
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
                                      borderRadius: BorderRadius.circular(8),
                                      color: CColors.scaffoldColor,
                                    ),
                                    child: const Text(
                                      "x 100",
                                      style: CustomTextStyles.darkGreyColor412,
                                    ),
                                  ),
                                  const Text(
                                    "RM 3.00",
                                    style: CustomTextStyles.darkGreyTwoColor414,
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
              10.ph,
            ],
          ),
        ),
      ),
    );
  }
}
