import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../../models/activity_model/activity_model.dart';
import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import '../../models/category_selection_model/category_selection_model.dart';
import '../../models/charts/column_chart_model.dart';
import '../../models/summary_model/summary_model.dart';
import '../../screen/home/dashboard/view/dashboard_screen.dart';
import '../../screen/home/settings/settings_landing/view/settings_landing_screen.dart';

class ConstantLists {
  ConstantLists._();

  // Bottom Navigation
  static List<BottomNavigationBarModel> bottomBarList = [
    BottomNavigationBarModel(
      itemIndex: 0,
      unSelectedIconString: Assets.bottomNavigationIconsDashBoardUnselected,
      selectedIconsString: Assets.bottomNavigationIconsDashBoardSelected,
      title: "Dashboard",
      onTapFunction: () {
        Get.offAll(
          () => const DashboardScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 1,
      unSelectedIconString: Assets.bottomNavigationIconsChatIconUnselected,
      selectedIconsString: Assets.bottomNavigationIconsChatIconSelected,
      title: "Chat",
      onTapFunction: () {
        // Get.offAll(
        //   () => const SearchDoctorScreen(),
        //   transition: Transition.fadeIn,
        // );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 2,
      unSelectedIconString:
          Assets.bottomNavigationIconsSquarePlusIconUnselected,
      selectedIconsString: Assets.bottomNavigationIconsSquarePlusIconUnselected,
      title: "Plus",
      onTapFunction: () {
        // Get.offAll(
        //   () => const MyAppointmentsLandingScreen(),
        //   transition: Transition.fadeIn,
        // );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 3,
      unSelectedIconString:
          Assets.bottomNavigationIconsActivitiesIconUnselected,
      selectedIconsString: Assets.bottomNavigationIconsActivitiesIconSelected,
      title: "Activities",
      onTapFunction: () {},
    ),
    BottomNavigationBarModel(
      itemIndex: 4,
      unSelectedIconString: Assets.bottomNavigationIconsSettingsUnselected,
      selectedIconsString: Assets.bottomNavigationIconsSettingsSelected,
      title: "Settings",
      onTapFunction: () {
        Get.offAll(
          () => const SettingsLandingScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
  ];
  static List<CategorySelectionModel> categorySelectionList = [
    CategorySelectionModel(
      iconString: Assets.iconsProductIcon,
      title: "I make or sell PRODUCTS.",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsServiceIcon,
      title: "I provide SERVICES.",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsArtist,
      title: "Artist,Photographers & Creative Types",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsProfessional,
      title: "Consultants & Professionals",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsFinancial,
      title: "Financial Services",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsHair,
      title: "Hair, Spa & Aesthetics",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsRealEstate,
      title: "Real Estates",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsTechnology,
      title: "Web, Technology & Media",
    ),
  ];
  static List<SummaryModel> summaryModelList = [
    SummaryModel(title: "activities", value: "600"),
    SummaryModel(title: "transactions", value: "\$ 120,345.00"),
    SummaryModel(title: "in progress", value: "80"),
  ];
  static List<ColumnChartData> revenueData = [
    ColumnChartData('Mon', 10),
    ColumnChartData('Tue', 15),
    ColumnChartData('Wed', 14),
    ColumnChartData('Thu', 13),
    ColumnChartData('Fri', 20),
    ColumnChartData('Sat', 14),
    ColumnChartData('Sun', 15),
  ];
  static List<ActivityModel> activityModelList = [
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Open",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "In Transit",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Complete",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Dispute",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "In Transit",
    ),
  ];
}
