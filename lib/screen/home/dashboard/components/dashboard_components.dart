import 'package:contro/utils/gaps/gaps.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:data_table_2/data_table_2.dart';
import '../../../../generated/assets.dart';
import '../../../../models/activity_model/activity_model.dart';
import '../../../../models/charts/column_chart_model.dart';
import '../../../../models/summary_model/summary_model.dart';
import '../../../../utils/colors/app_colors.dart';

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
          height: 35,
          width: 35,
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
              style: CustomTextStyles.greyTwoColor412,
            ),
            2.ph,
            Text(
              value,
              style: CustomTextStyles.darkGreyColor514,
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
          majorGridLines: MajorGridLines(
            width: 0,
          ),
          axisLine: AxisLine(
            width: 0,
          ),
          majorTickLines: MajorTickLines(
            width: 0,
          ),
          labelStyle: CustomTextStyles.darkGreyColor412,
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
