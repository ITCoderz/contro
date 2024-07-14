import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../models/activity_model/activity_model.dart';

class TimeLineComponent extends StatelessWidget {
  final ActivityModel activityModel;

  const TimeLineComponent({
    super.key,
    required this.activityModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? false
              : activityModel.activityStatus == "Payment has been completed."
                  ? false
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? false
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
          status: "An order is confirmed.",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? false
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? false
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? false
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? false
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
          status: "Payment has been completed.",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? false
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? false
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? false
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
          status: "The order is being processed now.",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? true
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? true
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? false
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
          status: "The order is on its way.",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? true
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? true
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? true
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? true
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? false
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
          status: "The order has been delivered.",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? true
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? true
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? true
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "An order is confirmed."
              ? true
              : activityModel.activityStatus == "Payment has been completed."
                  ? true
                  : activityModel.activityStatus ==
                          "The order is being processed now."
                      ? true
                      : activityModel.activityStatus ==
                              "The order is on its way."
                          ? true
                          : activityModel.activityStatus ==
                                  "The order has been delivered."
                              ? true
                              : activityModel.activityStatus ==
                                      "Order is complete."
                                  ? false
                                  : true,
          status: "Order is complete.",
        ),
      ],
    );
  }
}

class CustomDottedLine extends StatelessWidget {
  final bool inProgress;

  const CustomDottedLine({
    super.key,
    required this.inProgress,
  });

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.vertical,
      lineLength: 35,
      lineThickness: inProgress ? 1 : 2,
      dashLength: inProgress ? 4 : 2,
      dashGapLength: inProgress ? 4 : 0,
      dashColor: inProgress ? CColors.greyColor : CColors.mildGreenColor,
    ).paddingOnly(left: 10).alignWidget(
          alignment: Alignment.centerLeft,
        );
  }
}

class TimeLineCircularWidget extends StatelessWidget {
  final bool inProgress;
  final String status;

  const TimeLineCircularWidget({
    super.key,
    required this.inProgress,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 22,
          width: 22,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: inProgress ? CColors.greyColor : CColors.mildGreenColor,
            shape: BoxShape.circle,
          ),
          child: inProgress
              ? const SizedBox.shrink()
              : const Icon(
                  Icons.check_rounded,
                  color: CColors.whiteColor,
                  size: 15,
                ),
        ),
        10.pw,
        Text(
          status,
          style: CustomTextStyles.darkGreyColor412,
        ),
      ],
    );
  }
}
