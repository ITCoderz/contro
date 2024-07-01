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
      height: 200, // Adjust this height as needed
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

class PaginatedActiveOrdersTable extends StatelessWidget {
  final PaginatorController? paginationController;
  final List<ActivityModel> dataList;

  const PaginatedActiveOrdersTable({
    super.key,
    required this.paginationController,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      horizontalMargin: 10,
      columnSpacing: 10,
      renderEmptyRowsInTheEnd: false,
      wrapInCard: false,
      minWidth: context.width,
      border: TableBorder(
        horizontalInside: BorderSide(
          color: CColors.blackColor.withOpacity(0.1),
          width: 0.5,
        ),
        bottom: BorderSide.none,
      ),
      autoRowsToHeight: true,
      controller: paginationController,
      headingRowColor: WidgetStateProperty.all(Colors.transparent),
      headingRowHeight: 40,
      dataTextStyle: CustomTextStyles.darkGreyColor412,
      headingTextStyle: CustomTextStyles.darkGreyColor412,
      columns: <DataColumn>[
        DataColumn(
          label: TableTitleToggleComponent(
            titleString: "Order ID",
            onTapFunction: () {},
          ),
        ),
        DataColumn(
          label: TableTitleToggleComponent(
            titleString: "Created",
            onTapFunction: () {},
          ),
        ),
        DataColumn(
          label: TableTitleToggleComponent(
            titleString: "Price",
            onTapFunction: () {},
          ),
        ),
        DataColumn(
          label: TableTitleToggleComponent(
            titleString: "Status",
            onTapFunction: () {},
          ),
        ),
      ],
      empty: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[200],
          child: const Text('No data'),
        ),
      ),
      source: ActiveOrdersPaginatedTable(
        dataList: dataList,
      ),
    );
  }
}

class ActiveOrdersPaginatedTable extends DataTableSource {
  final List<ActivityModel> dataList;

  ActiveOrdersPaginatedTable({required this.dataList});

  @override
  DataRow? getRow(int index) {
    return DataRow(
      color: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return CColors.whiteColor;
          }
          return CColors.whiteColor;
        },
      ),
      cells: [
        DataCell(
          Text(
            "#${dataList[index].orderId}",
          ),
        ),
        DataCell(
          Text(
            dataList[index].created!,
          ),
        ),
        DataCell(
          Text(
            dataList[index].price!,
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: dataList[index].status == "Open"
                    ? CColors.yellowAccentColor
                    : dataList[index].status == "In Transit"
                        ? CColors.blueSecondColor
                        : dataList[index].status == "Complete"
                            ? CColors.greenAccentTwoColor
                            : CColors.redAccentColor),
            child: Text(
              dataList[index].status!,
              style: CustomTextStyles.white412,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => dataList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class TableTitleToggleComponent extends StatelessWidget {
  final String titleString;
  final Function()? onTapFunction;

  const TableTitleToggleComponent({
    super.key,
    required this.titleString,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleString,
          style: CustomTextStyles.darkGreyColor412,
          textAlign: TextAlign.left,
        ),
        5.pw,
        InkWell(
          onTap: onTapFunction,
          borderRadius: BorderRadius.circular(2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.iconsArrowUp,
                width: 7,
              ),
              2.ph,
              SvgPicture.asset(
                Assets.iconsArrowDown,
                width: 7,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
