// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:tonyyaooo/utils/alignment/widget_alignment.dart';
// import 'package:tonyyaooo/utils/gaps/gaps.dart';
// import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
// import '../../screens/home/upload_video/view/upload_video_screen.dart';
// import '../../utils/colors/app_colors.dart';
// import '../../utils/constants/constant_lists/constant_lists.dart';
// import '../custom_shapes/custom_shapes.dart';
//
// class CustomBottomAppBar extends StatelessWidget {
//   final int selectedIndex;
//
//   const CustomBottomAppBar({super.key, required this.selectedIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           tileMode: TileMode.clamp,
//           sigmaX: 5,
//           sigmaY: 5,
//         ),
//         child: BottomAppBar(
//           color: Colors.transparent,
//           padding: EdgeInsets.zero,
//           shadowColor: Colors.white.withOpacity(0.1),
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   20.ph,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       for (int index = 0;
//                           index < ConstantLists.bottomBarList.length;
//                           index++) ...[
//                         BottomNavBarComponent(
//                           selectedIndex: selectedIndex,
//                           bottomBarModel: ConstantLists.bottomBarList[index],
//                         ),
//                       ]
//                     ],
//                   ),
//                 ],
//               ).alignWidget(
//                 alignment: Alignment.center,
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     height: 62,
//                     width: 62,
//                     margin: EdgeInsets.only(
//                       right: context.isPortrait ? 4 : 10,
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {
//                           Get.to(
//                             () => const UploadVideoScreen(),
//                             transition: Transition.fadeIn,
//                           );
//                         },
//                         child: Ink(
//                           height: 62,
//                           width: 62,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: LinearGradient(
//                               colors: CColors.floatingActionGradient,
//                             ),
//                           ),
//                           child: const Center(
//                             child: Icon(
//                               Icons.add_rounded,
//                               color: CColors.whiteColor,
//                               size: 30,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   18.ph,
//                 ],
//               ).alignWidget(
//                 alignment: Alignment.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BottomNavBarComponent extends StatelessWidget {
//   final int selectedIndex;
//   final BottomNavigationBarModel bottomBarModel;
//
//   const BottomNavBarComponent({
//     super.key,
//     required this.selectedIndex,
//     required this.bottomBarModel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return bottomBarModel.itemIndex == 2
//         ? const SizedBox(
//             height: 10,
//             width: 50,
//           )
//         : InkWell(
//             borderRadius: BorderRadius.circular(
//               12,
//             ),
//             onTap: selectedIndex == bottomBarModel.itemIndex
//                 ? null
//                 : bottomBarModel.onTapFunction,
//             child: Ink(
//               height: 45,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 3,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(
//                   12,
//                 ),
//               ),
//               child: Center(
//                 child: SvgPicture.asset(
//                   selectedIndex == bottomBarModel.itemIndex
//                       ? bottomBarModel.selectedIconsString
//                       : bottomBarModel.unSelectedIconString,
//                   height: 24,
//                   width: 24,
//                 ),
//               ),
//             ),
//           );
//   }
// }
