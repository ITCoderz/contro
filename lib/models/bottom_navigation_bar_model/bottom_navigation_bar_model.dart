class BottomNavigationBarModel {
  int itemIndex;
  String title;
  String unSelectedIconString, selectedIconsString;
  Function()? onTapFunction;

  BottomNavigationBarModel({
    required this.itemIndex,
    required this.unSelectedIconString,
    required this.selectedIconsString,
    required this.title,
    required this.onTapFunction,
  });
}
