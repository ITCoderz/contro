import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import '../../models/category_selection_model/category_selection_model.dart';

class ConstantLists {
  ConstantLists._();

  // Bottom Navigation
  static List<BottomNavigationBarModel> bottomBarList = [
    // BottomNavigationBarModel(
    //   itemIndex: 0,
    //   unSelectedIconString: Assets.bottomNavigationBarIconsHomeIcon,
    //   selectedIconsString: Assets.bottomNavigationBarIconsHomeSelectedIcon,
    //   title: "Home",
    //   onTapFunction: () {
    //     // Get.offAll(
    //     //   () => const HomeLandingScreen(),
    //     //   transition: Transition.fadeIn,
    //     // );
    //   },
    // ),
    // BottomNavigationBarModel(
    //   itemIndex: 1,
    //   unSelectedIconString: Assets.bottomNavigationBarIconsExploreIcon,
    //   selectedIconsString: Assets.bottomNavigationBarIconsExploreSelectedIcon,
    //   title: "Explore",
    //   onTapFunction: () {
    //     // Get.offAll(
    //     //   () => const SearchDoctorScreen(),
    //     //   transition: Transition.fadeIn,
    //     // );
    //   },
    // ),
    // BottomNavigationBarModel(
    //   itemIndex: 2,
    //   unSelectedIconString: Assets.bottomNavigationBarIconsAppointmentsIcon,
    //   selectedIconsString:
    //       Assets.bottomNavigationBarIconsAppointmentsSelectedIcon,
    //   title: "Appointments",
    //   onTapFunction: () {
    //     // Get.offAll(
    //     //   () => const MyAppointmentsLandingScreen(),
    //     //   transition: Transition.fadeIn,
    //     // );
    //   },
    // ),
    // BottomNavigationBarModel(
    //   itemIndex: 3,
    //   unSelectedIconString: Assets.bottomNavigationBarIconsProfileIcon,
    //   selectedIconsString: "",
    //   title: "Profile",
    //   onTapFunction: () {},
    // ),
    // BottomNavigationBarModel(
    //   itemIndex: 3,
    //   unSelectedIconString: Assets.bottomNavigationBarIconsSupportIcon,
    //   selectedIconsString: "",
    //   title: "Support",
    //   onTapFunction: () {},
    // ),
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
}
