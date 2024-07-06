import 'package:contro/utils/gaps/gaps.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../generated/assets.dart';
import '../models/activity_model/activity_model.dart';
import '../screen/home/activities/activity_details/view/activity_detail_screen.dart';
import '../utils/colors/app_colors.dart';
import '../utils/text_styles/text_styles.dart';

class TableComponent extends StatefulWidget {
  final PaginatorController? paginationController;
  final List<ActivityModel> dataList;

  const TableComponent({
    super.key,
    required this.paginationController,
    required this.dataList,
  });

  @override
  _TableComponentState createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  List<ActivityModel> sortedDataList = [];
  bool sortAscendingCreated = true;
  bool sortAscendingPrice = true;
  bool sortAscendingOrderId = true;

  @override
  void initState() {
    super.initState();
    sortedDataList = List.from(widget.dataList);
  }

  void _sortCreated() {
    setState(() {
      if (sortAscendingCreated) {
        sortedDataList.sort((a, b) => _parseDate(a.created!).compareTo(_parseDate(b.created!)));
      } else {
        sortedDataList.sort((a, b) => _parseDate(b.created!).compareTo(_parseDate(a.created!)));
      }
      sortAscendingCreated = !sortAscendingCreated;
    });
  }

  void _sortPrice() {
    setState(() {
      if (sortAscendingPrice) {
        sortedDataList.sort((a, b) => _parsePrice(a.price!).compareTo(_parsePrice(b.price!)));
      } else {
        sortedDataList.sort((a, b) => _parsePrice(b.price!).compareTo(_parsePrice(a.price!)));
      }
      sortAscendingPrice = !sortAscendingPrice;
    });
  }

  void _sortOrderId() {
    setState(() {
      if (sortAscendingOrderId) {
        sortedDataList.sort((a, b) => a.orderId!.compareTo(b.orderId!));
      } else {
        sortedDataList.sort((a, b) => b.orderId!.compareTo(a.orderId!));
      }
      sortAscendingOrderId = !sortAscendingOrderId;
    });
  }

  DateTime _parseDate(String date) {
    final DateFormat format = DateFormat('dd/MM/yyyy');
    return format.parse(date);
  }

  double _parsePrice(String price) {
    return double.parse(price.replaceAll('\$', '').trim());
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      horizontalMargin: 5,
      columnSpacing: 0,
      minWidth: context.width - 40,
      border: TableBorder(
        horizontalInside: BorderSide(
          color: CColors.borderOneColor.withOpacity(0.1),
          width: 0.5,
        ),
        bottom: BorderSide.none,
      ),
      dividerThickness: 0.5,
      headingRowColor: WidgetStateProperty.all(Colors.transparent),
      headingRowHeight: 40,
      dataTextStyle: CustomTextStyles.darkGreyColor412,
      headingTextStyle: CustomTextStyles.darkGreyColor412,
      rows: [
        for (int index = 0; index < sortedDataList.length; index++) ...[
          DataRow(
            color: WidgetStateProperty.all(Colors.white),
            cells: [
              DataCell(
                Text(
                  "#${sortedDataList[index].orderId}",
                ),
              ),
              DataCell(
                Text(
                  sortedDataList[index].created!,
                ),
              ),
              DataCell(
                Text(
                  sortedDataList[index].price!,
                ),
              ),
              DataCell(
                GestureDetector(
                  onTap: () {
                    Get.to(
                          () => ActivityDetailScreen(
                        activityModel: sortedDataList[index],
                      ),
                      transition: Transition.fadeIn,
                    );
                  },
                  child: Container(
                    width: sortedDataList[index].status == "Open"
                        ? 61
                        : sortedDataList[index].status == "In Transit"
                        ? 91
                        : sortedDataList[index].status == "Complete"
                        ? 92
                        : 91,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: sortedDataList[index].status == "Open"
                            ? CColors.orangeColor
                            : sortedDataList[index].status == "In Transit"
                            ? CColors.blueSecondColor
                            : sortedDataList[index].status == "Complete"
                            ? CColors.greenTableColor
                            : CColors.redAccentColor),
                    child: Text(
                      sortedDataList[index].status!,
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
          onSort: (va,bool v){
            _sortOrderId();
          },
          label: TableTitleToggleComponent(
            titleString: "Order ID",
            onTapFunction: _sortOrderId,
          ),
        ),
        DataColumn(
          onSort: (va,bool v){
            _sortCreated();
          },
          label: TableTitleToggleComponent(
            titleString: "Created",
            onTapFunction: _sortCreated,
          ),
        ),
        DataColumn(
          onSort: (va,bool v){
            _sortPrice();
          },
          label: TableTitleToggleComponent(
            titleString: "Price",
            onTapFunction: _sortPrice,
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
    );
  }
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            titleString,
            style: CustomTextStyles.darkGreyColor412,
            textAlign: TextAlign.left,
          ),
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
