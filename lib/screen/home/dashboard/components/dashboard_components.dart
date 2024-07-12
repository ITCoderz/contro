import 'package:contro/utils/alignment/widget_alignment.dart';
import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../generated/assets.dart';
import '../../../../models/analytics_model/analytics_model.dart';
import '../../../../models/charts/column_chart_model.dart';
import '../../../../models/dashboard_overview_model/dashboard_overview_model.dart';
import '../../../../models/summary_model/summary_model.dart';
import '../../../../utils/colors/app_colors.dart';

class DashboardOverviewComponent extends StatelessWidget {
  final DashboardOverviewModel dashboardOverviewModel;

  const DashboardOverviewComponent({
    super.key,
    required this.dashboardOverviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: dashboardOverviewModel.index == 0
            ? CColors.yellowColor
            : dashboardOverviewModel.index == 1
                ? CColors.blueSecondColor
                : dashboardOverviewModel.index == 2
                    ? CColors.mildGreenColor
                    : CColors.redAccentColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            dashboardOverviewModel.iconString,
            width: 32,
          ),
          5.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dashboardOverviewModel.value,
                  style: CustomTextStyles.white512,
                ),
                Text(
                  dashboardOverviewModel.title,
                  style: CustomTextStyles.white412,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryComponent extends StatelessWidget {
  final SummaryModel overviewModel;

  const SummaryComponent({
    super.key,
    required this.overviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          overviewModel.value,
          style: CustomTextStyles.darkGreyColor418,
        ),
        3.ph,
        Text(
          overviewModel.title,
          style: CustomTextStyles.greyTwoColor414,
        ),
      ],
    );
  }
}

class OverviewComponent extends StatelessWidget {
  final double progressValue;
  final String title;
  final String value;

  const OverviewComponent({
    super.key,
    required this.progressValue,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Center(
            child: CircularProgressIndicator(
              color: CColors.blueColor,
              strokeWidth: 5,
              value: progressValue,
              strokeCap: StrokeCap.round,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  CColors.purpleAccentColor),
              backgroundColor: CColors.greyColor.withOpacity(
                0.5,
              ),
            ),
          ),
        ),
        10.pw,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyles.greyTwoColor410,
            ),
            2.ph,
            Text(
              value,
              style: CustomTextStyles.darkGreyTwoColor510,
            ),
          ],
        )
      ],
    );
  }
}

class CustomDailyRevenueChart extends StatelessWidget {
  final List<ColumnChartData> data;
  final TooltipBehavior tooltip;

  const CustomDailyRevenueChart({
    super.key,
    required this.data,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    double maxYValue = data.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(
          interval: 1,
          majorGridLines: MajorGridLines(
            width: 0,
          ),
          axisLine: AxisLine(
            width: 0,
          ),
          majorTickLines: MajorTickLines(
            width: 0,
          ),
          labelStyle: CustomTextStyles.darkGreyColor410,
        ),
        primaryYAxis: NumericAxis(
          isVisible: false, // Hide the Y-axis
          maximum: maxYValue, // Set the maximum Y value
        ),
        plotAreaBorderWidth: 0,
        tooltipBehavior: tooltip,
        backgroundColor: Colors.transparent,
        series: <CartesianSeries<ColumnChartData, String>>[
          ColumnSeries<ColumnChartData, String>(
            dataSource: data,
            xValueMapper: (ColumnChartData data, _) => data.x,
            yValueMapper: (ColumnChartData data, _) => data.y,
            name: 'Daily Revenue',
            borderRadius: BorderRadius.circular(4),
            width: 0.5,
            pointColorMapper: (ColumnChartData data, _) => data.y == 20
                ? CColors.purpleAccentColor
                : CColors.purpleAccentTwoColor.withOpacity(0.16),
          ),
        ],
      ),
    );
  }
}

class RevenueTiles extends StatelessWidget {
  final DashboardOverviewModel dashboardOverviewModel;

  const RevenueTiles({
    super.key,
    required this.dashboardOverviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: CColors.whiteColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dashboardOverviewModel.index == 0
                  ? CColors.mildGreenColor.withOpacity(0.12)
                  : dashboardOverviewModel.index == 1
                      ? CColors.orangeColor.withOpacity(0.12)
                      : dashboardOverviewModel.index == 2
                          ? CColors.mildGreenColor.withOpacity(0.12)
                          : CColors.blueThreeColor.withOpacity(0.12),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              dashboardOverviewModel.iconString,
              width: 20,
            ),
          ),
          5.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dashboardOverviewModel.value,
                  style: CustomTextStyles.darkGreyTwoColor513,
                ),
                Text(
                  dashboardOverviewModel.title,
                  style: CustomTextStyles.lightGreyTwoColor412,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnalyticsFilterTile extends StatelessWidget {
  final Function()? onTapFunction;
  final String value;

  const AnalyticsFilterTile({
    super.key,
    required this.onTapFunction,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapFunction,
        child: Ink(
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: CColors.scaffoldColor,
              ),
            ),
          ),
          child: Text(
            value,
            style: CustomTextStyles.darkGreyTwoColor412,
          )
              .paddingOnly(
                left: 20,
              )
              .alignWidget(
                alignment: Alignment.centerLeft,
              ),
        ),
      ),
    );
  }
}

class AnalyticTile extends StatelessWidget {
  final AnalyticsModel analyticModel;

  const AnalyticTile({
    super.key,
    required this.analyticModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: analyticModel.index == 0
            ? CColors.analyticColorOne
            : analyticModel.index == 1
                ? CColors.analyticColorTwo
                : CColors.analyticColorThree,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            analyticModel.percentage,
            style: CustomTextStyles.white717,
          ),
          5.ph,
          Text(
            analyticModel.value,
            style: CustomTextStyles.white413,
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              analyticModel.isIncoming
                  ? SvgPicture.asset(Assets.iconsSuccessArrow)
                  : SvgPicture.asset(Assets.iconsFailureArrow),
              3.pw,
              Expanded(
                child: Text(
                  analyticModel.percentageTwo,
                  style: analyticModel.isIncoming
                      ? CustomTextStyles.mildGreenColor615
                      : CustomTextStyles.redAccentColor615,
                ),
              ),
            ],
          ),
          5.ph,
          Text(
            analyticModel.transactionDescription,
            style: CustomTextStyles.white412,
          ),
        ],
      ),
    );
  }
}
