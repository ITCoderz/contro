// Paginated Widget also Added if the you want to use that just uncomment the properties and in place of DataTable2 use PaginatedDataTable2

import 'package:contro/utils/gaps/gaps.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';
import '../models/activity_model/activity_model.dart';
import '../screen/home/activities/activity_details/view/activity_detail_screen.dart';
import '../utils/colors/app_colors.dart';
import '../utils/text_styles/text_styles.dart';

class TableComponent extends StatelessWidget {
  final PaginatorController? paginationController;
  final List<ActivityModel> dataList;

  const TableComponent({
    super.key,
    required this.paginationController,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      horizontalMargin: 10,
      columnSpacing: 10,
      // renderEmptyRowsInTheEnd: false,
      // wrapInCard: false,
      minWidth: context.width,

      border: TableBorder(
        horizontalInside: BorderSide(
          color: CColors.borderOneColor.withOpacity(0.1),
          width: 0.5,
        ),
        bottom: BorderSide.none,
      ),
      // autoRowsToHeight: true,
      // controller: paginationController,
      dividerThickness: 0.5,
      headingRowColor: WidgetStateProperty.all(Colors.transparent),
      headingRowHeight: 40,
      dataTextStyle: CustomTextStyles.darkGreyColor412,
      headingTextStyle: CustomTextStyles.darkGreyColor412,
      rows: [
        for (int index = 0; index < dataList.length; index++) ...[
          DataRow(
            color: WidgetStateProperty.all(Colors.white),
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
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ActivityDetailScreen(
                        activityModel: dataList[index],
                      ),
                      transition: Transition.fadeIn,
                    );
                  },
                  child: Container(
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
              ),
            ],
          ),
        ]
      ],
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
      // source: ActiveOrdersPaginatedTable(
      //   dataList: dataList,
      // ),
    );
  }
}

class PaginatedTable extends DataTableSource {
  final List<ActivityModel> dataList;

  PaginatedTable({required this.dataList});

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
          GestureDetector(
            onTap: () {},
            child: Container(
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
