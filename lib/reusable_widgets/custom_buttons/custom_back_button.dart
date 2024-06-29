// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../generated/assets.dart';
// import '../../utils/colors/app_colors.dart';
//
// class CircularBackButton extends StatelessWidget {
//   final Function()? onBackButtonPressed;
//   final String iconAsset;
//   final double height, width;
//   final Color? backgroundColor;
//
//   const CircularBackButton({
//     super.key,
//     this.onBackButtonPressed,
//     this.iconAsset = Assets.appbarIconsArrowLeftIcon,
//     this.height = 40,
//     this.width = 40,
//     this.backgroundColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         onPressed: onBackButtonPressed,
//         style: ElevatedButton.styleFrom(
//           fixedSize: Size(height, width),
//           shape: const CircleBorder(),
//           padding: EdgeInsets.zero,
//           backgroundColor: backgroundColor ?? Colors.transparent,
//           alignment: Alignment.center,
//           elevation: 0.0,
//           side: const BorderSide(color: CColors.lightGreyColorThree),
//         ),
//         child: SvgPicture.asset(
//           iconAsset,
//         ),
//       ),
//     );
//   }
// }
