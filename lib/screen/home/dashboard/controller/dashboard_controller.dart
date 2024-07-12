import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardController extends GetxController {
  late TooltipBehavior tooltip;
  PaginatorController paginationActivityController = PaginatorController();

  final analyticFilter = "Monthly".obs;

  @override
  void onInit() {
    tooltip = TooltipBehavior(enable: true);
    super.onInit();
  }

  changeFilter({required String value}) {
    analyticFilter.value = value;
    Get.back();
  }
}
