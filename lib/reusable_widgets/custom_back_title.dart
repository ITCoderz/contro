import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_styles/text_styles.dart';

class CustomBackTitle extends StatelessWidget {
  final String title;
  final bool hasCrossIcon;

  const CustomBackTitle(
      {super.key, required this.title, this.hasCrossIcon = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            hasCrossIcon ? Icons.close_rounded : Icons.arrow_back_ios_rounded,
            size: hasCrossIcon ? 20 : 17,
          ),
        ),
        Text(
          title,
          style: CustomTextStyles.darkGreyColor618,
        ),
      ],
    );
  }
}
