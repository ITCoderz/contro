import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? false
              : activityModel.activityStatus == "Order Processing"
                  ? false
                  : activityModel.activityStatus == "On the Way"
                      ? false
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
          status: "Order Confirmed",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? true
              : activityModel.activityStatus == "Order Processing"
                  ? false
                  : activityModel.activityStatus == "On the Way"
                      ? false
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? true
              : activityModel.activityStatus == "Order Processing"
                  ? false
                  : activityModel.activityStatus == "On the Way"
                      ? false
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
          status: "Order Processing",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? true
              : activityModel.activityStatus == "Order Processing"
                  ? true
                  : activityModel.activityStatus == "On the Way"
                      ? false
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? true
              : activityModel.activityStatus == "Order Processing"
                  ? true
                  : activityModel.activityStatus == "On the Way"
                      ? false
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
          status: "On the Way",
        ),
        CustomDottedLine(
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? true
              : activityModel.activityStatus == "Order Processing"
                  ? true
                  : activityModel.activityStatus == "On the Way"
                      ? true
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
        ),
        TimeLineCircularWidget(
          inProgress: activityModel.activityStatus == "Order Confirmed"
              ? true
              : activityModel.activityStatus == "Order Processing"
                  ? true
                  : activityModel.activityStatus == "On the Way"
                      ? true
                      : activityModel.activityStatus == "Order Delivered"
                          ? false
                          : true,
          status: "Order Delivered",
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
      lineLength: 45,
      lineThickness: inProgress ? 1 : 2,
      dashLength: inProgress ? 1 : 45,
      dashColor: inProgress ? CColors.greenAccentColor : CColors.whiteColor,
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
          height: 20,
          width: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: inProgress
                ? CColors.whiteColor.withOpacity(0.4)
                : CColors.whiteColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.circle,
            size: 10,
            color: CColors.greenAccentColor,
          ),
        ),
        15.pw,
        Text(
          status,
          style: CustomTextStyles.darkGreyColor412,
        ),
      ],
    );
  }
}
